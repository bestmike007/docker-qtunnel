FROM golang:1.9.2-alpine3.6
MAINTAINER Yuanhai He <i@bestmike007.com>
RUN apk add --no-cache make git && \
    cd && git clone https://github.com/getqujing/qtunnel.git qtunnel && \
    cd qtunnel && make

FROM alpine:3.6
MAINTAINER Yuanhai He <i@bestmike007.com>
COPY --from=0 /root/qtunnel/bin/qtunnel /usr/local/bin/qtunnel

ENTRYPOINT ["qtunnel"]
