FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# 基础工具
RUN apt update && apt install -y \
    tzdata \
    zsh \
    git \
    curl \
    wget \
    vim \
    nano \
    tmux \
    sudo \
    unzip \
    zip \
    build-essential \
    ca-certificates \
    locales \
    net-tools \
    iproute2 \
    iputils-ping \
    dnsutils \
    tcpdump \
    traceroute \
    mtr-tiny \
    nmap \
    netcat-openbsd \
    lsof \
    procps \
    htop \
    jq \
    tree \
    autojump \
    less \
    file \
    openssh-client \
    rsync \
    && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && locale-gen en_US.UTF-8 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*


#
# zsh 安装脚本（手动触发）
#
COPY ./install-zsh.sh /usr/local/bin/install-zsh.sh
RUN chmod +x /usr/local/bin/install-zsh.sh


#
# nvs
#
ENV NVS_HOME=${HOME}/.nvs

RUN git clone --depth=1 \
    https://github.com/jasongin/nvs.git \
    ${NVS_HOME} \
    && . ${NVS_HOME}/nvs.sh \
    && nvs add lts \
    && nvs use lts

RUN curl -fsSL https://yarnpkg.com/latest.tar.gz -o /tmp/yarn.tar.gz \
    && mkdir -p /opt/yarn \
    && tar -xzf /tmp/yarn.tar.gz -C /opt/yarn --strip-components=1 \
    && ln -sf /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -sf /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg \


WORKDIR ${HOME}


CMD ["bash"]