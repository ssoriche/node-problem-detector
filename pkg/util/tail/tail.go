// Copyright 2016 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Package tail implements "tail -F" functionality following rotated logs
// Adopted from cadvisor v0.36.0: https://github.com/google/cadvisor/compare/v0.36.0...v0.37.0
package tail

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"sync"
	"time"

	"github.com/fsnotify/fsnotify"
	"github.com/golang/glog"
)

type Tail struct {
	reader     *bufio.Reader
	readerErr  error
	readerLock sync.RWMutex
	filename   string
	file       *os.File
	stop       chan bool
	watcher    *fsnotify.Watcher
}

const (
	defaultRetryInterval = 100 * time.Millisecond
	maxRetryInterval     = 30 * time.Second
)

// NewTail starts opens the given file and watches it for deletion/rotation
func NewTail(filename string) (*Tail, error) {
	t, err := newTail(filename)
	if err != nil {
		return nil, err
	}
	go t.watchLoop()
	return t, nil
}

// newTail creates a Tail object.
func newTail(filename string) (*Tail, error) {
	t := &Tail{
		filename: filename,
	}
	var err error
	t.stop = make(chan bool)
	t.watcher, err = fsnotify.NewWatcher()
	if err != nil {
		return nil, fmt.Errorf("inotify init failed on %s: %v", t.filename, err)
	}
	// Initialize readerErr as io.EOF, so that the reader can work properly
	// during initialization.
	t.readerErr = io.EOF
	return t, nil
}

// Read implements the io.Reader interface for Tail
func (t *Tail) Read(p []byte) (int, error) {
	t.readerLock.RLock()
	defer t.readerLock.RUnlock()
	if t.readerErr != nil {
		return 0, t.readerErr
	}
	return t.reader.Read(p)
}

var _ io.ReadCloser = &Tail{}

// Close stops watching and closes the file
func (t *Tail) Close() error {
	close(t.stop)
	return nil
}

func (t *Tail) attemptOpen() error {
	t.readerLock.Lock()
	defer t.readerLock.Unlock()
	t.readerErr = nil
	attempt := 0
	var lastErr error
	for interval := defaultRetryInterval; ; interval *= 2 {
		attempt++
		glog.V(4).Infof("Opening %s (attempt %d)", t.filename, attempt)
		var err error
		t.file, err = os.Open(t.filename)
		if err == nil {
			// TODO: not interested in old events?
			// t.file.Seek(0, os.SEEK_END)
			t.reader = bufio.NewReader(t.file)
			return nil
		}
		lastErr = err
		glog.V(4).Infof("open log file %s error: %v", t.filename, err)

		if interval >= maxRetryInterval {
			break
		}
		select {
		case <-time.After(interval):
		case <-t.stop:
			t.readerErr = io.EOF
			return fmt.Errorf("watch was cancelled")
		}
	}
	err := fmt.Errorf("can't open log file %s: %v", t.filename, lastErr)
	t.readerErr = err
	return err
}

func (t *Tail) watchLoop() {
	for {
		err := t.watchFile()
		if err != nil {
			glog.Errorf("Tail failed on %s: %v", t.filename, err)
			break
		}
	}
}

func (t *Tail) watchFile() error {
	err := t.attemptOpen()
	if err != nil {
		return err
	}
	defer t.file.Close()

	watchDir := filepath.Dir(t.filename)
	err = t.watcher.Add(watchDir)
	if err != nil {
		return fmt.Errorf("Failed to add watch to directory %s: %v", watchDir, err)
	}
	defer t.watcher.Remove(watchDir)

	for {
		select {
		case event, ok := <-t.watcher.Events:
			if !ok {
				return nil
			}
			if event.Op&fsnotify.Rename == fsnotify.Rename || event.Op&fsnotify.Remove == fsnotify.Remove {
				eventPath := filepath.Clean(event.Name) // Directory events have an extra '/'
				if eventPath == t.filename {
					glog.V(4).Infof("Log file %s moved/deleted", t.filename)
					return nil
				}
			}

		case <-t.stop:
			return fmt.Errorf("watch was cancelled")
		}
	}
}
