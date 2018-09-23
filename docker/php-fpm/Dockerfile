FROM php:7.2.10-fpm-stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y git zlib1g-dev zip unzip
RUN docker-php-ext-install zip

RUN mkdir -p /app
ADD ./public/ /app/public/

WORKDIR /app
