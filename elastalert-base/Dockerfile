FROM centos:7
MAINTAINER "H.Chen" <winghc@hotmail.com>

# clone from https://github.com/krizsan/elastalert-docker

RUN yum clean all \
	&& yum install -y wget net-tools curl systemd epel-release \
	&& yum-config-manager --enable epel \
	&& rm -rf /etc/localtime \
	&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& yum -y install python-setuptools python-pip gcc python-devel python-configparser PyYAML libyaml libyaml-devel\
	&& pip install --upgrade pip \
	&& pip install python-dateutil setuptools configparser aws-requests-auth texttable croniter PyStaticConfiguration -U 

