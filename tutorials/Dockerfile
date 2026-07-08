# syntax=docker/dockerfile:1

ARG GO_VERSION=1.26.4
FROM golang:${GO_VERSION}

WORKDIR /workspace

COPY . .

RUN sed -i 's/\r$//' /workspace/docker-entrypoint.sh /workspace/verify.sh \
    && chmod +x /workspace/docker-entrypoint.sh /workspace/verify.sh

ENTRYPOINT ["/workspace/docker-entrypoint.sh"]
