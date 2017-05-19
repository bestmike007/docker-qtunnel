FROM golang:1.8.1-alpine
MAINTAINER Yuanhai He <i@bestmike007.com>
RUN apk add --no-cache make git && \
    cd && git clone https://github.com/getqujing/qtunnel.git qtunnel && \
    cd qtunnel && make && \
    mv bin/qtunnel /usr/local/bin && \
    cd .. && rm -rf qtunnel && \
    apk del make git

ENTRYPOINT ["qtunnel"]
