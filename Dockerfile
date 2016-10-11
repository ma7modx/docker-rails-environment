FROM ubuntu:14.04.5
RUN mkdir /home/src
WORKDIR /home/src
EXPOSE 80

# default packages
RUN apt-get update
RUN apt-get install -y --no-install-recommends wget nano less dpkg curl ssh
RUN apt-get install -y --no-install-recommends software-properties-common

# dependencies for ruby
RUN apt-get install -y --no-install-recommends git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# install RVM, Ruby, and Bundler
RUN apt-get install -y --no-install-recommends libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.1"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# nodejs and rails
RUN \curl -sL https://deb.nodesource.com/setup_4.x #| -E bash -
RUN apt-get install -y --no-install-recommends nodejs
RUN /bin/bash -l -c "gem install rails -v 4.2.6 --no-ri --no-rdoc"
EXPOSE 3000

# mysql
RUN apt-get install -y --no-install-recommends debconf-utils
ENV DEBIAN_FRONTEND noninteractive
ENV MYSQL_ROOT_PASSWORD letmein

RUN bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"'
RUN bash -c 'debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"'
RUN apt-get install -qqy --no-install-recommends mysql-server
RUN apt-get install -y --no-install-recommends mysql-client libmysqlclient-dev

# elasticsearch
RUN bash -c "add-apt-repository -y ppa:webupd8team/java"
RUN bash -c "add-apt-repository ppa:openjdk-r/ppa"  
RUN apt-get update
RUN apt-get install -y openjdk-7-jre
RUN bash -c 'debconf-set-selections <<< "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true"'
RUN apt-get install -y oracle-java8-installer
RUN wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb
RUN dpkg -i elasticsearch-1.7.2.deb

# redis
RUN apt-get install -y --no-install-recommends build-essential tcl8.5
RUN wget http://download.redis.io/releases/redis-stable.tar.gz
RUN tar xzf redis-stable.tar.gz
RUN cd redis-stable && make && make install
RUN ./redis-stable/utils/install_server.sh
EXPOSE 6379
