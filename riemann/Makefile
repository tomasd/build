create_target:
	mkdir -p target
download: create_target
	curl -L https://aphyr.com/riemann/riemann-0.2.11.tar.bz2 -o target/riemann-0.2.11.tar.bz2
extract:
	tar -xvf target/riemann-0.2.11.tar.bz2 -C target
rpm: extract
	fpm -s dir -t rpm -n riemann -v 0.2.11 --rpm-os linux \
	-d jre-1.8.0 \
	--config-files /etc/riemann/riemann.config \
	--config-files /etc/sysconfig/riemann \
	--before-install rpm/before_install.sh \
	--after-install rpm/after_install.sh \
	--after-remove rpm/after_remove.sh \
	target/riemann-0.2.11=/usr/lib \
	etc=/ \
	usr=/ \

clean:
	rm -f *.rpm

vagrant:
	vagrant init centos/7

deploy:
	scp *.rpm root@repo.drencak.com:/repos/CentOS/ && \
	ssh root@repo.drencak.com createrepo --update /repos/CentOS/


all: download extract rpm
