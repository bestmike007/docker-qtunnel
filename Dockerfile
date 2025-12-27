FROM golang:1.25-alpine3.23
ENV GO111MODULE=off
RUN apk add --no-cache make git binutils && \
    cd && git clone https://github.com/getqujing/qtunnel.git qtunnel && \
    cd qtunnel && make && strip bin/qtunnel

FROM alpine:3.23
COPY --from=0 /root/qtunnel/bin/qtunnel /usr/local/bin/qtunnel

ENTRYPOINT ["qtunnel"]
