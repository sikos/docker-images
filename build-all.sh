#!/bin/bash -x

if ! [ -f openjdk8.tar.gz ]; then 
    curl -L https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u322-b06/OpenJDK8U-jdk_x64_alpine-linux_hotspot_8u322b06.tar.gz -o openjdk8.tar.gz
fi
if ! [ -f openjdk11.tar.gz ]; then 
    curl -L https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.14.1%2B1/OpenJDK11U-jdk_x64_alpine-linux_hotspot_11.0.14.1_1.tar.gz -o openjdk11.tar.gz
fi

docker build -f Dockerfile.jdk8.slim              -t localhost:jdk8-alpine .
docker build -f Dockerfile.jdk11.slim             -t localhost:jdk11-alpine .

docker build -f Dockerfile.alpine.jdk8-mvn-3.8.5  -t localhost:jdk8-mvn-alpine . 
docker build -f Dockerfile.alpine.jdk11-mvn-3.8.5 -t localhost:jdk11-mvn-alpine .

docker images
