#!/usr/bin/env bash
docker version
docker build -t ruby-node .
docker images
docker run -it ruby-node bash # Enter container terminal
