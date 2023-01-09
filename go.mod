module k8s.io/node-problem-detector

go 1.15

require (
	cloud.google.com/go v0.54.0
	code.cloudfoundry.org/clock v0.0.0-20180518195852-02e53af36e6c
	contrib.go.opencensus.io/exporter/prometheus v0.0.0-20190427222117-f6cda26f80a3
	contrib.go.opencensus.io/exporter/stackdriver v0.13.4
	github.com/StackExchange/wmi v0.0.0-20181212234831-e0a55b97c705 // indirect
	github.com/acobaugh/osrelease v0.0.0-20181218015638-a93a0a55a249
	github.com/avast/retry-go v2.4.1+incompatible
	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
	github.com/euank/go-kmsg-parser v2.0.0+incompatible
	github.com/go-ole/go-ole v1.2.4 // indirect
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	github.com/google/cadvisor v0.39.4
	github.com/hpcloud/tail v1.0.0
	github.com/onsi/ginkgo v1.16.5
	github.com/onsi/gomega v1.10.1
	github.com/pborman/uuid v1.2.0
	github.com/prometheus/client_model v0.2.0
	github.com/prometheus/common v0.26.0
	github.com/prometheus/procfs v0.6.0
	github.com/shirou/gopsutil v2.19.12+incompatible
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.7.0
	github.com/tedsuo/ifrit v0.0.0-20180802180643-bea94bb476cc // indirect
	go.opencensus.io v0.22.4
	golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d
	golang.org/x/sys v0.0.0-20210616094352-59db8d763f22
	google.golang.org/api v0.20.0
	k8s.io/api v0.22.17
	k8s.io/apimachinery v0.22.17
	k8s.io/client-go v11.0.1-0.20190805182717-6502b5e7b1b5+incompatible
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

replace github.com/google/cadvisor => github.com/google/cadvisor v0.36.0
