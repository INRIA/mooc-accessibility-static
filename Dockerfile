FROM alpine:3.10

LABEL maintainer="dcaselli@inria.fr"

ARG HUGO_VERSION=0.59.0

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /hugo.tar.gz
RUN tar -zxvf hugo.tar.gz
RUN rm hugo.tar.gz

RUN mv hugo /usr/local/bin/
