FROM alpine:3.21

RUN apk add --no-cache \
    7zip \
    rclone \
    bash \
    curl \
    tzdata \
    moreutils

ENV TZ=Asia/Shanghai

ENTRYPOINT ["/bin/bash"]