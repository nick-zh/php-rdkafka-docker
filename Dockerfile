FROM php:7.2-fpm-alpine3.8

ARG LIBRDKAFKA_VERSION
ARG EXT_RDKAFKA_VERSION

RUN apk add autoconf gcc g++ librdkafka=$LIBRDKAFKA_VERSION librdkafka-dev=$LIBRDKAFKA_VERSION make \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community

RUN pecl channel-update pecl.php.net && \
    pecl install rdkafka-$EXT_RDKAFKA_VERSION && \
    docker-php-ext-enable rdkafka
