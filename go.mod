module k8s.io/node-problem-detector

go 1.15

require (
	cloud.google.com/go v0.54.0
	code.cloudfoundry.org/clock v0.0.0-20180518195852-02e53af36e6c
	contrib.go.opencensus.io/exporter/prometheus v0.0.0-20190427222117-f6cda26f80a3
	contrib.go.opencensus.io/exporter/stackdriver v0.13.4
	github.com/Nvveen/Gotty v0.0.0-20120604004816-cd527374f1e5 // indirect
	github.com/Rican7/retry v0.1.1-0.20160712041035-272ad122d6e5 // indirect
	github.com/SeanDolphin/bqschema v0.0.0-20150424181127-f92a08f515e1 // indirect
	github.com/StackExchange/wmi v0.0.0-20181212234831-e0a55b97c705 // indirect
	github.com/abbot/go-http-auth v0.0.0-20140618235127-c0ef4539dfab // indirect
	github.com/acobaugh/osrelease v0.0.0-20181218015638-a93a0a55a249
	github.com/avast/retry-go v2.4.1+incompatible
	github.com/checkpoint-restore/go-criu v0.0.0-20190109184317-bdb7599cd87b // indirect
	github.com/containerd/continuity v0.0.0-20200107194136-26c1120b8d41 // indirect
	github.com/containerd/fifo v0.0.0-20191213151349-ff969a566b00 // indirect
	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
	github.com/docker/go-events v0.0.0-20190806004212-e31b211e4f1c // indirect
	github.com/euank/go-kmsg-parser v2.0.0+incompatible
	github.com/garyburd/redigo v0.0.0-20150301180006-535138d7bcd7 // indirect
	github.com/go-ini/ini v1.9.0 // indirect
	github.com/go-ole/go-ole v1.2.4 // indirect
	github.com/godbus/dbus v0.0.0-20190422162347-ade71ed3457e // indirect
	github.com/gogo/googleapis v1.3.1 // indirect
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	github.com/google/cadvisor v0.39.4
	github.com/gotestyourself/gotestyourself v2.2.0+incompatible // indirect
	github.com/hpcloud/tail v1.0.0
	github.com/influxdb/influxdb v0.9.6-0.20151125225445-9eab56311373 // indirect
	github.com/kevinburke/go-bindata v3.17.0+incompatible // indirect
	github.com/klauspost/crc32 v0.0.0-20151223135126-a3b15ae34567 // indirect
	github.com/mattn/go-shellwords v1.0.4-0.20180201004752-39dbbfa24bbc // indirect
	github.com/mesos/mesos-go v0.0.7-0.20180413204204-29de6ff97b48 // indirect
	github.com/onsi/ginkgo v1.16.5
	github.com/onsi/gomega v1.10.1
	github.com/opencontainers/runtime-tools v0.0.0-20181011054405-1d69bd0f9c39 // indirect
	github.com/pborman/uuid v1.2.0
	github.com/pquerna/ffjson v0.0.0-20171002144729-d49c2bc1aa13 // indirect
	github.com/prometheus/client_model v0.2.0
	github.com/prometheus/common v0.26.0
	github.com/prometheus/procfs v0.6.0
	github.com/shirou/gopsutil v2.19.12+incompatible
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.7.0
	github.com/tedsuo/ifrit v0.0.0-20180802180643-bea94bb476cc // indirect
	github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f // indirect
	github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 // indirect
	github.com/xeipuuv/gojsonschema v0.0.0-20180618132009-1d523034197f // indirect
	go.opencensus.io v0.22.4
	golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d
	golang.org/x/sys v0.0.0-20210616094352-59db8d763f22
	google.golang.org/api v0.20.0
	gopkg.in/olivere/elastic.v2 v2.0.12 // indirect
	k8s.io/api v0.22.17
	k8s.io/apimachinery v0.22.17
	k8s.io/client-go v11.0.1-0.20190805182717-6502b5e7b1b5+incompatible
	k8s.io/cloud-provider v0.22.17
	k8s.io/heapster v0.0.0-20180704153620-b25f8a16208f
	k8s.io/kubernetes v1.14.6
	k8s.io/test-infra v0.0.0-20190914015041-e1cbc3ccd91c
)

replace git.apache.org/thrift.git => github.com/apache/thrift v0.0.0-20180902110319-2566ecd5d999

replace k8s.io/kubernetes => k8s.io/kubernetes v1.22.17

replace (
	k8s.io/api => k8s.io/api v0.22.17
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.22.17
	k8s.io/apimachinery => k8s.io/apimachinery v0.22.17
	k8s.io/apiserver => k8s.io/apiserver v0.22.17
	k8s.io/cli-runtime => k8s.io/cli-runtime v0.22.17
	k8s.io/client-go => k8s.io/client-go v0.22.17
	k8s.io/cloud-provider => k8s.io/cloud-provider v0.22.17
	k8s.io/cluster-bootstrap => k8s.io/cluster-bootstrap v0.22.17
	k8s.io/code-generator => k8s.io/code-generator v0.22.17
	k8s.io/component-base => k8s.io/component-base v0.22.17
	k8s.io/component-helpers => k8s.io/component-helpers v0.22.17
	k8s.io/controller-manager => k8s.io/controller-manager v0.22.17
	k8s.io/cri-api => k8s.io/cri-api v0.22.17
	k8s.io/csi-translation-lib => k8s.io/csi-translation-lib v0.22.17
	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.22.17
	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.22.17
	k8s.io/kube-proxy => k8s.io/kube-proxy v0.22.17
	k8s.io/kube-scheduler => k8s.io/kube-scheduler v0.22.17
	k8s.io/kubectl => k8s.io/kubectl v0.22.17
	k8s.io/kubelet => k8s.io/kubelet v0.22.17
	k8s.io/legacy-cloud-providers => k8s.io/legacy-cloud-providers v0.22.17
	k8s.io/metrics => k8s.io/metrics v0.22.17
	k8s.io/mount-utils => k8s.io/mount-utils v0.22.17
	k8s.io/pod-security-admission => k8s.io/pod-security-admission v0.22.17
	k8s.io/sample-apiserver => k8s.io/sample-apiserver v0.22.17
	k8s.io/sample-cli-plugin => k8s.io/sample-cli-plugin v0.22.17
	k8s.io/sample-controller => k8s.io/sample-controller v0.22.17
)
