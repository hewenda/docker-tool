FROM gopherdata/gophernotes:latest

ENV TZ=Asia/Shanghai

RUN apk add --no-cache bash tzdata && \
    ln -sf /usr/bin/python3 /usr/bin/python3.6 && \
    pip3 install --no-cache-dir --force-reinstall \
        jupyter \
        notebook \
        jupyterlab \
        jupyterlab-language-pack-zh-CN

CMD ["jupyter", "lab", "--no-browser", "--allow-root", "--ip=0.0.0.0"]