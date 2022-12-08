# PHP-FPM Docker Image

Docker container to install and run [PHP-FPM](https://php-fpm.org/).

[![Build Status](https://travis-ci.org/nanoninja/php-fpm.svg?branch=master)](https://travis-ci.org/nanoninja/php-fpm) [![Automated Build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/nanoninja/php-fpm/builds/)

## Supported branches and respective Dockerfile links

- master [Dockerfile](https://github.com/nanoninja/php-fpm/blob/master/Dockerfile)
- 8.2 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/8.2/Dockerfile)
- 8.1 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/8.1/Dockerfile)
- 8.0 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/8.0/Dockerfile)
- 7.4.10 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.4.10/Dockerfile)
- 7.4.4 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.4.4/Dockerfile)
- 7.4.2 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.4.2/Dockerfile)
- 7.4.0 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.4.0/Dockerfile)
- 7.3.10 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.3.10/Dockerfile)
- 7.3.9 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.3.9/Dockerfile)
- 7.3.8 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.3.8/Dockerfile)
- 7.3.7 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.3.7/Dockerfile)
- 7.3.6 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.3.6/Dockerfile)
- 7.3.3 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.3.3/Dockerfile)
- 7.3.2 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.3.2/Dockerfile)
- 7.2.15 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.2.15/Dockerfile)
- 7.2.13 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.2.13/Dockerfile)
- 7.2.2 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.2.2/Dockerfile)
- 7.1.14 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/7.1.14/Dockerfile)
- 5.6.40 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/5.6.40/Dockerfile)
- 5.6.32 [Dockerfile](https://github.com/nanoninja/php-fpm/blob/5.6.32/Dockerfile)

## What is PHP-FPM

PHP-FPM (FastCGI Process Manager) is an alternative FastCGI implementation for PHP.

## Getting image

```sh
sudo docker image pull nanoninja/php-fpm
```

## Running your PHP script

Run the PHP-FPM image, mounting a directory from your host.

```sh
sudo docker container run --rm -v $(pwd):/var/www/html nanoninja/php-fpm php index.php
```

## Running as server

```sh
sudo docker container run --rm --name phpfpm -v $(pwd):/var/www/html -p 3000:3000 nanoninja/php-fpm php -S="0.0.0.0:3000" -t="/var/www/html"
```

or using [Docker Compose](https://docs.docker.com/compose/) :

```sh
version: '3'
services:
  phpfpm:
    container_name: phpfpm
    image: nanoninja/php-fpm
    ports:
      - 3000:3000
    volumes:
      - /path/to/your/app:/var/www/html
    command: php -S="0.0.0.0:3000" -t="/var/www/html"
```

### Logging

```sh
sudo docker container logs phpfpm
```

## Installed extensions

```bash
sudo docker container run --rm nanoninja/php-fpm php -m
```

### PHP Modules

- bcmath
- bz2
- calendar
- Core
- ctype
- curl
- date
- dom
- exif
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
- Zend OPcache
- zip
- zlib

### Zend Modules

- Xdebug
- Zend OPcache