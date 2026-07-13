FROM gopherdata/gophernotes:latest

ENV TZ=Asia/Shanghai

RUN apk add --no-cache bash tzdata && \
    ln -sf /usr/bin/python3 /usr/bin/python3.6 && \
    pip3 install --no-cache-dir jupyterlab-language-pack-zh-CN