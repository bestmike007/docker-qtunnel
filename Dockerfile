FROM alpine:3.5
MAINTAINER Yuanhai He <i@bestmike007.com>
RUN apk add --no-cache go make git musl-dev && \
    cd && git clone https://github.com/getqujing/qtunnel.git qtunnel && \
    cd qtunnel && make && \
    mv bin/qtunnel /usr/local/bin && \
    cd .. && rm -rf qtunnel && \
    apk del go make git musl-dev

ENTRYPOINT ["qtunnel"]
