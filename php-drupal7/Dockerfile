FROM php:fpm

MAINTAINER Eric <ericstone.dev@gmail.com>

# install the PHP extensions we need
RUN apt-get update \
        && buildDeps=" \
                git \
                libmemcached-dev \
                zlib1g-dev \
                libpng-dev \
                libjpeg-dev \
                libpq-dev \
                mysql-client \
        " \
        && doNotUninstall=" \
                libmemcached11 \
                libmemcachedutil2 \
                zlib1g-dev \
                libpng-dev \
                libjpeg-dev \
                libpq-dev \
        " \
        && apt-get install -y $buildDeps --no-install-recommends \
        && rm -r /var/lib/apt/lists/* \
        \
        && docker-php-source extract \
        && git clone --branch php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached/ \
        && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
        && docker-php-ext-install memcached gd mbstring pdo pdo_mysql pdo_pgsql zip

# install Drush
ENV DRUSH_VERSION 8.1.16
RUN curl -L --silent https://github.com/drush-ops/drush/releases/download/${DRUSH_VERSION}/drush.phar \
  > /usr/local/bin/drush && chmod +x /usr/local/bin/drush

# install redis
ENV PHPREDIS_VERSION 3.1.6
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-${PHPREDIS_VERSION} /usr/src/php/ext/redis \
    && docker-php-ext-install redis

# install envsubst
RUN apt-get update && apt-get install -y gettext-base

# clean cache
RUN apt-get autoremove && apt-get autoclean

RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

WORKDIR /var/www
