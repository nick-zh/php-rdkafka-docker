# Supported tags and respective `Dockerfile` links
[`latest`, `72-fpm-alpine3.8-lib-0.11.6-r0-ext-3.0.5-composer` (Dockerfile)](https://github.com/nick-zh/php-rdkafka-docker/blob/72-fpm-alpine3.8-lib-0.11.6-r0-ext-3.0.5-composer/Dockerfile "Dockerfile")
[`72-fpm-alpine3.8-lib-0.11.6-r0-ext-3.0.5` (Dockerfile)](https://github.com/nick-zh/php-rdkafka-docker/blob/72-fpm-alpine3.8-lib-0.11.6-r0-ext-3.0.5/Dockerfile "Dockerfile")


# Build it yourself
```
docker build . --build-arg LIBRDKAFKA_VERSION=<version> --build-arg EXT_RDKAFKA_VERSION=<version> -t <tag>
```