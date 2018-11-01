# php-rdkafka-docker

## Description
PHP docker image with librdkafka and ext-rdkafka preinstalled.
The image is built with php:7.2-fpm-alpine3.8 as base and the
newest librdkafka release (0.11.6 at the time)

## Build it yourself
```
docker build . --build-arg LIBRDKAFKA_VERSION=<version> --build-arg EXT_RDKAFKA_VERSION=<version> -t <tag>
```
