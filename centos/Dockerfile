FROM centos:7
MAINTAINER "H.Chen" <winghc@hotmail.com>

RUN yum clean all \
   && yum install -y java-1.7.0-openjdk wget net-tools curl \
   && rm -rf /etc/localtime \
   && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

