FROM yunabe/lgo:latest

ENV TZ=Asia/Shanghai
USER root

RUN apt-get update && \
    apt-get install -y tzdata && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-deps --no-cache-dir jupyterlab-language-pack-zh-CN

WORKDIR /workspace
USER gopher

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--NotebookApp.token=", "--NotebookApp.password=", "--notebook-dir=/workspace"]