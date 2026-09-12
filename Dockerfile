FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ARG WILDRIG_VERSION

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates wget tar libcurl4 libssl3 ocl-icd-libopencl1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/wildrig

RUN wget -q \
    "https://github.com/andru-kun/wildrig-multi/releases/download/${WILDRIG_VERSION}/wildrig-multi-linux-${WILDRIG_VERSION}.tar.gz" \
    -O /tmp/wildrig.tar.gz \
    && tar -xzf /tmp/wildrig.tar.gz -C /opt/wildrig \
    && rm /tmp/wildrig.tar.gz \
    && chmod +x /opt/wildrig/wildrig-multi

ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

ENTRYPOINT ["/opt/wildrig/wildrig-multi"]
