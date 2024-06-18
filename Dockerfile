# FROM ubuntu:20.04
# LABEL maintainer="your_email@example.com"
# RUN apt-get update && apt-get install -y \
#     curl \
#     libc6 \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*
# WORKDIR /workspace
# CMD ["bash"]

# ====================
# FROM python:3.9
# WORKDIR /app
# RUN apt-get -y update
# RUN apt-get -y upgrade
# RUN apt-get install -y ffmpeg

FROM alpine:3.19
RUN apk add --no-cache python3 \
      && pip3 install tailon==1.4.2 \
      && apk update \
      && apk add grep gawk \
      && rm -f /usr/bin/awk /bin/grep \
      && ln -s /usr/bin/gawk /usr/bin/awk \
      && ln -s /usr/bin/grep /bin/grep \
      && rm -rf /var/cache/apk/* \
      && rm -rf /tmp/* \
      && mkdir /tailon \
      && echo "tailon -b 0.0.0.0:8080 -f /var/log -r '/tailon/' -F -t 100 -m tail grep awk sed" > /tailon/run.sh \
      && chmod 755 /tailon/run.sh
EXPOSE 8080
CMD ["/tailon/run.sh"]
