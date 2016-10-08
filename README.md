# docker-rails-environment
  This repository contains Dockerfile for rails installation and the most commonly used dependencies in development.

## Base docker image
  [dockerfile/ubutnu-14.04.5] (https://hub.docker.com/_/ubuntu/)

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
  2. docker pull ma7modx/rails-development-environment.
  
## Usage
  - docker run -i -t -v {host volume}:{container volume}:rw {image name}
  e.g.
  ```
  sudo mkdir /docker_shared
  
  docker run -i -t -p 8080:3000 -v /docker_shared/:/home/src:rw rails-development-environment
  ```
  these folders will be shared between docker and the host

### Notes
  **mysql root password: letmein**
  
