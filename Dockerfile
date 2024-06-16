FROM ubuntu:18.04

LABEL maintainer="your_email@example.com"

RUN apt-get update && apt-get install -y \
    curl \
    libc6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["bash"]
