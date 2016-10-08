# PHP-FPM Docker Image
Docker container to install and run [PHP-FPM](https://php-fpm.org/).

[![Build Status](https://travis-ci.org/nanoninja/php-fpm.svg?branch=master)](https://travis-ci.org/nanoninja/php-fpm)

## What is PHP-FPM ?
PHP-FPM (FastCGI Process Manager) is an alternative FastCGI implementation for PHP.

## Getting image
```shell
docker pull nanoninja/php-fpm
```

## Basic usage

```shell
docker run -v /path/to/your/app:/var/www/html -d nanoninja/php-fpm
```

## Running your PHP script

### Running image
Run the PHP-FPM image, mounting a directory from your host.
```shell
docker run -it --name phpfpm -v /path/to/your/app:/var/www/html nanoninja/php-fpm php index.php
```
or using [Docker Compose](https://docs.docker.com/compose/):
```shell
version: '2'
services:
  phpfpm:
    container_name: phpfpm
    image: nanoninja/php-fpm
    entrypoint: php index.php
    volumes:
      - /path/to/your/app:/var/www/html
```

### Logging
```shell
docker logs phpfpm
```
or using [Docker Compose](https://docs.docker.com/compose/):
```shell
docker-compose logs phpfpm
```

## Installed extensions
 - bz2
 - gd
 - iconv
 - mbstring
 - mcrypt
 - mysqli
 - mongodb
 - pdo_mysql
 - pdo_pgsql
 - pgsql
 - zip
