FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

ARG USERNAME=deck
ARG USER_UID=1000


# 基础环境
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
    file \
    less \
    && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && locale-gen en_US.UTF-8 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*


# 创建与 SteamOS 一致的用户
RUN useradd \
    --create-home \
    --shell /bin/zsh \
    --uid ${USER_UID} \
    ${USERNAME} \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}


USER ${USERNAME}

ENV HOME=/home/${USERNAME}
WORKDIR /home/${USERNAME}/project


# 安装 Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


# zsh 插件
RUN git clone \
    https://github.com/zsh-users/zsh-autosuggestions \
    ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
    && git clone \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


# nvm
ENV NVM_DIR=/home/${USERNAME}/.nvm

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash \
    && . ${NVM_DIR}/nvm.sh \
    && nvm install --lts \
    && nvm alias default lts/* \
    && npm install -g yarn


# 复制 zsh 配置
COPY --chown=${USERNAME}:${USERNAME} .zshrc ${HOME}/.zshrc


# distrobox 会注入宿主 code 命令
# 创建占位命令避免部分环境检测失败
RUN mkdir -p ${HOME}/.local/bin \
    && ln -sf /usr/bin/true ${HOME}/.local/bin/code


ENV PATH=${HOME}/.local/bin:${PATH}


CMD ["zsh"]