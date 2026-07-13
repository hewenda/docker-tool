FROM gopherdata/gophernotes:latest-ds

ENV TZ=Asia/Shanghai

RUN apk update && \
    apk add --no-cache bash tzdata && \
    ln -sf /usr/bin/python3 /usr/bin/python