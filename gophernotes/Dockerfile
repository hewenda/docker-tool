FROM yunabe/lgo:latest

ENV TZ=Asia/Shanghai

RUN apk add --no-cache bash tzdata && \
    pip install --no-deps --no-cache-dir jupyterlab-language-pack-zh-CN

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--NotebookApp.token=", "--NotebookApp.password=", "--notebook-dir=/workspace"]