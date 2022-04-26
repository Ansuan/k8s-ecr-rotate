FROM alpine:3.15

LABEL com.emergya.vendor="Emergya"
LABEL com.emergya.image.authors="arobles@emergya.com"

RUN apk add --no-cache \
        python3 \
        py3-pip \
        curl \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/bin/kubectl