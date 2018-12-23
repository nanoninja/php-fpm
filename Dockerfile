FROM php:7.2.13-fpm

LABEL maintainer="Vincent Letourneau <vincent@nanoninja.com>"

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
        g++ \
        git \
        libbz2-dev \
        libc-client-dev \
        libcurl4-gnutls-dev \
        libedit-dev \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libkrb5-dev \
        libldap2-dev \
        libmagickwand-dev \
        libmcrypt-dev \
        libmemcached-dev \
        libpq-dev \
        libsodium-dev \
        libsqlite3-dev \
        libssl-dev \
        libreadline-dev \
        libxml2-dev \
        libxslt1-dev \
        wget \
        unzip \
        zlib1g-dev \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        bz2 \
        calendar \
        ctype \
        curl \
        fileinfo \
        ftp \
        gettext \
        iconv \
        mbstring \
        mysqli \
        pdo_mysql \
        pdo_pgsql \
        pdo_sqlite \
        phar \
        pgsql \
        readline \
        soap \
        sockets \
        sodium \
        xml \
        xmlrpc \
        xmlwriter \
        xsl \
        zip \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && pecl install mongodb && docker-php-ext-enable mongodb \
    && pecl install redis && docker-php-ext-enable redis \
    && yes '' | pecl install imagick && docker-php-ext-enable imagick \
    && docker-php-source delete \
    && apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*