#!/usr/bin/env bash

docker build --no-cache --build-arg BRANCH=master -t ojordann/flutter:master .
docker build --no-cache --build-arg BRANCH=dev -t ojordann/flutter:dev .
docker build --no-cache --build-arg BRANCH=beta -t ojordann/flutter:beta .
docker build --no-cache --build-arg BRANCH=stable -t ojordann/flutter:stable -t ojordann/flutter:latest .

docker push ojordann/flutter:master
docker push ojordann/flutter:dev
docker push ojordann/flutter:beta
docker push ojordann/flutter:stable
docker push ojordann/flutter:latest