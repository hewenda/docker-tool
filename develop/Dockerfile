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
# Oh My Zsh 系统安装
#
RUN git clone \
    https://github.com/ohmyzsh/ohmyzsh.git \
    /opt/oh-my-zsh


#
# zsh 插件
#
RUN mkdir -p /opt/zsh-plugins \
    && git clone \
       https://github.com/zsh-users/zsh-autosuggestions.git \
       /opt/zsh-plugins/zsh-autosuggestions \
    && git clone \
       https://github.com/zsh-users/zsh-syntax-highlighting.git \
       /opt/zsh-plugins/zsh-syntax-highlighting


#
# nvm
#
ENV NVM_DIR=/opt/nvm

RUN mkdir -p ${NVM_DIR} \
    && git clone \
       https://github.com/nvm-sh/nvm.git \
       ${NVM_DIR} \
    && cd ${NVM_DIR} \
    && git checkout $(git describe --abbrev=0 --tags) \
    && . ${NVM_DIR}/nvm.sh \
    && nvm install --lts \
    && nvm alias default lts/* \
    && npm install -g yarn


#
# 项目目录
#
RUN mkdir -p /workspace


WORKDIR /workspace


CMD ["zsh"]