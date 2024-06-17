# FROM ubuntu:20.04

# LABEL maintainer="your_email@example.com"

# RUN apt-get update && apt-get install -y \
#     curl \
#     libc6 \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

# WORKDIR /workspace

# CMD ["bash"]
FROM python:3.9
WORKDIR /app
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ffmpeg
