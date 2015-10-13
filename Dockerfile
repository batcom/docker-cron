# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  echo -n 'deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse\ndeb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse\ndeb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse\ndeb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse\ndeb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse\ndeb http://nginx.org/packages/ubuntu/ trusty nginx \ndeb-src http://nginx.org/packages/ubuntu/ trusty nginx\n' > /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential software-properties-common && \
  apt-get install -y curl git htop man unzip vim wget && \
  apt-get install -y libxml2-dev libxslt1-dev python-dev && \
  apt-get install -y python-pip python-setuptools && \
  pip install requests lxml cssselect PyQuery && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./start.sh /start.sh
ADD src/ /root/src/
RUN chmod 755 /start.sh
CMD ["/bin/bash", "/start.sh"]
