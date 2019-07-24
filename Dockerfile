FROM ubuntu:16.04

ARG BUILDER_UID=9999

ENV HOME /home/builder
ENV BUCKET filter-config-test-2.aodn.org.au

RUN apt-get update && apt-get install -y --no-install-recommends \
    awscli \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --no-log-init --shell /bin/bash --uid $BUILDER_UID builder
USER builder
WORKDIR /home/builder
