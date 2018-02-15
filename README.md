# PHP-FPM Docker Image
Docker container to install and run [PHP-FPM 7.2](https://php-fpm.org/).

[![Build Status](https://travis-ci.org/nanoninja/php-fpm.svg?branch=master)](https://travis-ci.org/nanoninja/php-fpm) [![Automated Build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/nanoninja/php-fpm/builds/)

## Supported branches and respective Dockerfile links

 - 7.2 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.2/Dockerfile)
 - 7.1 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.1/Dockerfile)
 - 5.6 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/5.6/Dockerfile)

## What is PHP-FPM ?
PHP-FPM (FastCGI Process Manager) is an alternative FastCGI implementation for PHP.

## Getting image
```sh
sudo docker pull nanoninja/php-fpm:7.2
```

## Running your PHP script

### Running image
Run the PHP-FPM image, mounting a directory from your host.

```sh
sudo docker run -it --name phpfpm -v /path/to/your/app:/var/www/html nanoninja/php-fpm:7.2 php index.php
```

or using [Docker Compose](https://docs.docker.com/compose/):

```sh
version: '3'
services:
  phpfpm:
    container_name: phpfpm
    image: nanoninja/php-fpm:7.2
    entrypoint: php index.php
    volumes:
      - /path/to/your/app:/var/www/html
```

### Running as server

```sh
sudo docker run --rm --name phpfpm -v /path/to/your/app:/var/www/html -p 3000:3000 nanoninja/php-fpm:7.2 php-fpm -S="0.0.0.0:3000" -t="/var/www/html"
```

### Logging
```sh
sudo docker logs phpfpm
```

# Listing installed extensions

```sh
sudo docker run --rm -it nanoninja/php-fpm:7.2 php -m
```

## Installed extensions
 - bz2
 - Core
 - ctype
 - curl
 - date
 - dom
 - fileinfo
 - filter
 - ftp
 - gd
 - hash
 - iconv
 - imagick
 - imap
 - intl
 - json
 - libxml
 - mbstring
 - memcached
 - mongodb
 - mysqli
 - mysqlnd
 - openssl
 - pcre
 - PDO
 - pdo_mysql
 - pdo_pgsql
 - pdo_sqlite
 - pgsql
 - Phar
 - posix
 - readline
 - redis
 - Reflection
 - session
 - SimpleXML
 - soap
 - sodium
 - SPL
 - sqlite3
 - standard
 - tokenizer
 - xdebug
 - xml
 - xmlreader
 - xmlwriter
 - zip
 - zlib
