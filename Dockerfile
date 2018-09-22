FROM golang:1.11.0-stretch

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . .