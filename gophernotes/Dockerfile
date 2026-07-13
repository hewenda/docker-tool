FROM gopherdata/gophernotes:latest-ds

USER root
ENV TZ=Asia/Shanghai

RUN apt-get update && \
    apt-get install -y --no-install-recommends bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*