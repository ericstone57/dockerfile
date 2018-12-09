#!/bin/bash
set -e
set -x

IMG=registry.cn-hangzhou.aliyuncs.com/kuri/php-drupal7:latest

docker pull php:fpm
docker build . -t $IMG
docker push $IMG
