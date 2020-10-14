ARG PHP_IMAGE_TAG

FROM php:$PHP_IMAGE_TAG

ARG LIBRDKAFKA_VERSION
ARG EXT_RDKAFKA_VERSION
ARG INSTALL_COMPOSER
ENV INSTALL_COMPOSER=$INSTALL_COMPOSER
ENV BUILD_DEPS 'autoconf git gcc g++ make bash openssh libssl1.1'

RUN apk --no-cache upgrade \
    && apk add $BUILD_DEPS

RUN git clone --depth 1 --branch v$LIBRDKAFKA_VERSION https://github.com/edenhill/librdkafka.git \
    && cd librdkafka \
    && ./configure \
    && make \
    && make install

RUN if [ $INSTALL_COMPOSER = "yes" ]; then \
        curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer; \
    fi;

RUN pecl channel-update pecl.php.net \
    && pecl install rdkafka-$EXT_RDKAFKA_VERSION \
    && docker-php-ext-enable rdkafka \
    && rm -rf /librdkafka \
    && apk del $BUILD_DEPS
