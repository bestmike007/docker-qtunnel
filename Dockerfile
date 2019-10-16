FROM golang:1.13.1-alpine3.10
MAINTAINER Yuanhai He <i@bestmike007.com>
RUN apk add --no-cache make git && \
    cd && git clone https://github.com/getqujing/qtunnel.git qtunnel && \
    cd qtunnel && make

FROM alpine:3.10
MAINTAINER Yuanhai He <i@bestmike007.com>
COPY --from=0 /root/qtunnel/bin/qtunnel /usr/local/bin/qtunnel

ENTRYPOINT ["qtunnel"]
