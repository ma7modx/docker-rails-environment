# docker-rails-environment
  This repository contains Dockerfile for rails installation and the most commonly used dependencies in development.

## Base docker image
  [ubutnu-14.04.5] (https://hub.docker.com/_/ubuntu/)

## On this Dockerfile
  - RVM
  - Ruby 2.3.1 
  - Rails 4.2.6
  - Nodejs
  - Mysql
  - Elasticsearch
  - Redis
  
## Installation 
  1. Install [Docker] (https://www.docker.com/).
  2. Pull the image 
    ```
    docker pull ma7modx/rails-development-environment.
    ```
  
## Usage
  - docker run -i -t -p {published port}:{original port} -v {host volume}:{container volume}:rw {image name} {command}
  e.g.
  ```
  mkdir /home/{user}/docker_shared
  
  sudo docker run -i -t -p 3000:3000 -p 6379:6379 -p 3306:3306 -p 9200:9200 -v /home/{user}/docker_shared/:/home/src:rw ma7modx/rails-development-environment /bin/bash -l
  ```
  these folders will be shared and auto updated between docker and host, and port 3000 will be published to 8080
  - docker run command should be used only on the first time to build the container, to reuse this container 
  ```
  sudo docker start -i ma7modx/rails-development-environment
  ```
  - you may need to run this command to create mysql socket if it wasn't created
  ```
  service mysql restart
  ```

### Notes
  mysql root password is empty string
  
