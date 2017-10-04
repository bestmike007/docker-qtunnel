FROM golang:1.9.0-alpine3.6
MAINTAINER Yuanhai He <i@bestmike007.com>
RUN apk add --no-cache make git && \
    cd && git clone https://github.com/getqujing/qtunnel.git qtunnel && \
    cd qtunnel && make && \
    mv bin/qtunnel /usr/local/bin && \
    cd .. && rm -rf qtunnel && \
    apk del --no-cache make git

ENTRYPOINT ["qtunnel"]
