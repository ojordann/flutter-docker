#!/usr/bin/env bash

docker build --no-cache --build-arg BRANCH=master -t ojordann/flutter:master .
docker build --no-cache --build-arg BRANCH=dev -t ojordann/flutter:dev .
docker build --no-cache --build-arg BRANCH=beta -t ojordann/flutter:beta .
docker build --no-cache --build-arg BRANCH=stable -t ojordann/flutter:stable -t ojordann/flutter:latest .