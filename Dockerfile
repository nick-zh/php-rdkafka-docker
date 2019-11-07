FROM php:7.2-fpm-alpine3.8

ARG LIBRDKAFKA_VERSION
ARG EXT_RDKAFKA_VERSION

RUN apk --no-cache upgrade && \
    apk add autoconf git gcc g++ make bash

RUN git clone --depth 1 --branch v$LIBRDKAFKA_VERSION https://github.com/edenhill/librdkafka.git \
    && cd librdkafka \
    && ./configure \
    && make \
    && make install

RUN pecl channel-update pecl.php.net && \
    pecl install rdkafka-$EXT_RDKAFKA_VERSION && \
    docker-php-ext-enable rdkafka && \
    rm -rf /librdkafka && \
    apk del autoconf git gcc g++ make bash
