create_target:
	mkdir -p target
download: create_target
	curl -L https://github.com/prometheus/prometheus/releases/download/v1.3.1/prometheus-1.3.1.linux-amd64.tar.gz -o target/prometheus-1.3.1.linux-amd64.tar.gz
extract:
	tar -xvf target/prometheus-1.3.1.linux-amd64.tar.gz -C target
rpm: extract
	fpm -s dir -t rpm -n prometheus -v 1.3.1 --rpm-os linux \
	--config-files /etc/prometheus/prometheus.yaml \
	--before-install rpm/before_install.sh \
	--after-remove rpm/after_remove.sh \
	target/prometheus-1.3.1.linux-amd64=/usr/lib \
	etc=/ \
	usr=/ \

clean:
	rm -f *.rpm

vagrant:
	vagrant init centos/7

all: download extract rpm
