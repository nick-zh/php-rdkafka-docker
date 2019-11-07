FROM php:7.2-fpm-alpine3.10

ARG LIBRDKAFKA_VERSION
ARG EXT_RDKAFKA_VERSION
ENV BUILD_DEPS 'autoconf git gcc g++ make bash'

RUN apk --no-cache upgrade \
    && apk add $BUILD_DEPS

RUN git clone --depth 1 --branch v$LIBRDKAFKA_VERSION https://github.com/edenhill/librdkafka.git \
    && cd librdkafka \
    && ./configure \
    && make \
    && make install

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN pecl channel-update pecl.php.net \
    && pecl install rdkafka-$EXT_RDKAFKA_VERSION \
    && docker-php-ext-enable rdkafka \
    && rm -rf /librdkafka \
    && apk del $BUILD_DEPS
