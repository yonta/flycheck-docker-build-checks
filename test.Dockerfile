From alpine
Run echo hello > /greeting.txt
EntRYpOiNT ["cat", "/greeting.txt"]

FROM scratch
COPY ./tmp/helloworld.txt /helloworld.txt

FROM debian:latest AS builder
RUN apt-get update; apt-get install -y curl

FROM golang:latest AS builder

FROM --platform=linux/amd64 alpine AS base
RUN apk add --no-cache git

ARG TAG
# FROM busybox:${TAG}

FROM alpine
ENTRYPOINT my-program start
# entrypoint becomes: /bin/sh -c my-program start

FROM alpine
ARG foo "bar"

ENV DEPS \
    curl \
    git \
    make

MAINTAINER moby@example.com

FROM alpine
ENTRYPOINT ["echo", "Hello, Norway!"]
ENTRYPOINT ["echo", "Hello, Sweden!"]
# Only "Hello, Sweden!" will be printed

FROM alpine
RUN apk add \

    gnupg \

  curl

FROM --platform=$TARGETPLATFORM alpine AS builder
RUN apk add --no-cache git

FROM alpine AS scratch
FROM alpine AS context

FROM scratch
ARG AWS_SECRET_ACCESS_KEY

FROM alpine AS BuilderBase

FROM node:22${VARIANT} AS jsbuilder

FROM alpine AS base
COPY $foo .

FROM nginx AS web
WORKDIR usr/share/nginx/html
COPY public .
