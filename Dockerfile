FROM golang:1.24.2-alpine3.21
MAINTAINER Yuanhai He <i@bestmike007.com>
ENV GO111MODULE=off
RUN apk add --no-cache make git binutils && \
    cd && git clone https://github.com/getqujing/qtunnel.git qtunnel && \
    cd qtunnel && make && strip bin/qtunnel

FROM alpine:3.21
MAINTAINER Yuanhai He <i@bestmike007.com>
COPY --from=0 /root/qtunnel/bin/qtunnel /usr/local/bin/qtunnel

ENTRYPOINT ["qtunnel"]
