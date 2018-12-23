# PHP-FPM Docker Image

Docker container to install and run [PHP-FPM](https://php-fpm.org/).

[![Build Status](https://travis-ci.org/nanoninja/php-fpm.svg?branch=master)](https://travis-ci.org/nanoninja/php-fpm) [![Automated Build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/nanoninja/php-fpm/builds/)

## Supported branches and respective Dockerfile links

- 7.2.13 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.2.13/Dockerfile)
- 7.2.2 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.2/Dockerfile)
- 7.1.14 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.1/Dockerfile)
- 5.6.32 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/5.6/Dockerfile)

## What is PHP-FPM

PHP-FPM (FastCGI Process Manager) is an alternative FastCGI implementation for PHP.

## Getting image

```sh
sudo docker pull nanoninja/php-fpm
```

## Running your PHP script

### Running image

Run the PHP-FPM image, mounting a directory from your host.

```sh
sudo docker run -it --name phpfpm -v /path/to/your/app:/var/www/html nanoninja/php-fpm php index.php
```

or using [Docker Compose](https://docs.docker.com/compose/) :

```sh
version: '3'
services:
  phpfpm:
    container_name: phpfpm
    image: nanoninja/php-fpm
    entrypoint: php index.php
    volumes:
      - /path/to/your/app:/var/www/html
```

### Running as server

```sh
sudo docker run --rm --name phpfpm -v /path/to/your/app:/var/www/html -p 3000:3000 nanoninja/php-fpm php-fpm -S="0.0.0.0:3000" -t="/var/www/html"
```

### Logging

```sh
sudo docker logs phpfpm
```

## Listing installed extensions

or using [Docker Compose](https://docs.docker.com/compose/) :

```sh
sudo docker run --rm -it nanoninja/php-fpm php -m
```

## Installed extensions

### PHP Modules

- bcmath
- bz2
- calendar
- Core
- ctype
- curl
- date
- dom
- fileinfo
- filter
- ftp
- gd
- gettext
- hash
- iconv
- imagick
- imap
- intl
- json
- ldap
- libxml
- mbstring
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
- sockets
- sodium
- SPL
- sqlite3
- standard
- tokenizer
- xdebug
- xml
- xmlreader
- xmlrpc
- xmlwriter
- xsl
- zip
- zlib

### Zend Modules

- Xdebug
