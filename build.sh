#!/bin/bash
export TAG=go1.25-alpine3.23
docker build --force-rm -t bestmike007/qtunnel:$TAG .
docker push bestmike007/qtunnel:$TAG
