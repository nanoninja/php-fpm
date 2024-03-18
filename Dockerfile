FROM php:8.3-fpm
#FROM php:8.3-fpm-alpine

LABEL maintainer="Sergey Kozlov <hello@sergeykozlov.ru>"


##################################
# https://gist.github.com/Wirone/d5c794b4fef0203146a27687e80588a6
# See: https://github.com/Imagick/imagick/pull/616

ARG IMAGICK_PHP83_FIX_COMMIT=9df92616f577e38625b96b7b903582a46c064739

RUN apt-get -q update \
    && apt-get -yq upgrade \
    && export PHP_DEV_DEPS='libmagickwand-dev' \
    && apt-get -yq install make unzip --no-install-recommends libmagickwand-6.q16-6 $PHP_DEV_DEPS \
    # Install Imagick from specific archive (PR's #616 code)
    && curl -L https://github.com/remicollet/imagick/archive/${IMAGICK_PHP83_FIX_COMMIT}.zip -o /tmp/imagick-issue-php83.zip \
    && unzip /tmp/imagick-issue-php83.zip -d /tmp \
    && pecl install /tmp/imagick-${IMAGICK_PHP83_FIX_COMMIT}/package.xml \
    && apt-get purge -y $PHP_DEV_DEPS $PHPIZE_DEPS \
    && apt-get autoremove -y --purge \
    && apt-get clean all \
    && rm -Rf /tmp/*
    
##################################

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    g++ \
    libbz2-dev \
    libc-client-dev \
    libcurl4-gnutls-dev \
    libedit-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libkrb5-dev \
    libldap2-dev \
    libldb-dev \
    libmagickwand-dev \
    libmcrypt-dev \
    libmemcached-dev \
    libpng-dev \
    libpq-dev \
    libsqlite3-dev \
    libssl-dev \
    libreadline-dev \
    libxslt1-dev \
    libzip-dev \
    memcached \
    wget \
    make \
#    unzip \
    zlib1g-dev \
    && docker-php-ext-install -j$(nproc) \
    bcmath \
    bz2 \
    calendar \
    exif \
    gettext \
    mysqli \
    opcache \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    soap \
    xsl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && PHP_OPENSSL=yes docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure ldap \
    && docker-php-ext-install ldap \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && CFLAGS="$CFLAGS -D_GNU_SOURCE" docker-php-ext-install sockets \
    && pecl install xmlrpc-1.0.0RC3 && docker-php-ext-enable xmlrpc \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && pecl install memcached && docker-php-ext-enable memcached \
    && pecl install mongodb && docker-php-ext-enable mongodb \
    && pecl install redis && docker-php-ext-enable redis \
#    && yes '' | pecl install imagick && docker-php-ext-enable imagick \
    && docker-php-source delete \
    && apt-get remove -y g++ wget \
    && apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/*



