FROM php:7.3-fpm-alpine3.10

ARG LIBRDKAFKA_VERSION
ARG EXT_RDKAFKA_VERSION

RUN apk --no-cache upgrade && \
    apk --no-cache add bash openssh autoconf gcc g++ make

RUN apk add librdkafka=$LIBRDKAFKA_VERSION librdkafka-dev=$LIBRDKAFKA_VERSION \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN pecl channel-update pecl.php.net && \
    pecl install rdkafka-$EXT_RDKAFKA_VERSION && \
    docker-php-ext-enable rdkafka
