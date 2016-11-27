create_target:
	mkdir -p target
download: create_target
	curl -L https://github.com/prometheus/pushgateway/releases/download/v0.3.1/pushgateway-0.3.1.linux-amd64.tar.gz -o target/pushgateway-0.3.1.linux-amd64.tar.gz
extract:
	tar -xvf target/pushgateway-0.3.1.linux-amd64.tar.gz -C target
rpm: extract
	fpm -s dir -t rpm -n pushgateway -v 0.3.1 --rpm-os linux \
	--before-install rpm/before_install.sh \
	--after-remove rpm/after_remove.sh \
	target/pushgateway-0.3.1.linux-amd64/pushgateway=/usr/bin/ \
    usr=/

clean:
	rm -f *.rpm

vagrant:
	vagrant init centos/7

deploy:
	scp *.rpm root@repo.drencak.com:/repos/CentOS/ && \
	ssh root@repo.drencak.com createrepo --update /repos/CentOS/

all: download extract rpm
