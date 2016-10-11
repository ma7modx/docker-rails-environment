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
  - docker run -i -t -p {published port}:{original port} -v {host volume}:{container volume}:rw {image name}
  e.g.
  ```
  sudo mkdir /docker_shared
  
  sudo docker run -i -t -p 8080:3000 -v /docker_shared/:/home/src:rw ma7modx/rails-development-environment
  ```
  these folders will be shared and auto updated between docker and host, and port 3000 will be published to 8080

### Notes
  **mysql root password: letmein**
  
