FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

ARG USERNAME=deck
ARG USER_UID=1000


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
    && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && locale-gen en_US.UTF-8 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*


# 创建与 SteamOS 一致用户
RUN useradd \
    --create-home \
    --shell /bin/zsh \
    --uid ${USER_UID} \
    ${USERNAME} \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}


USER ${USERNAME}

ENV HOME=/home/${USERNAME}
ENV NVM_DIR=/home/${USERNAME}/.nvm

WORKDIR /home/${USERNAME}/project


# Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


# zsh 插件
RUN git clone \
    https://github.com/zsh-users/zsh-autosuggestions \
    ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
    && git clone \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${HOME}/.ohmyzsh/custom/plugins/zsh-syntax-highlighting || true


# 修正路径（上面的目录修正）
RUN rm -rf ${HOME}/.ohmyzsh/custom/plugins/zsh-syntax-highlighting \
    && git clone \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


# nvm + Node LTS + yarn
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash \
    && . ${NVM_DIR}/nvm.sh \
    && nvm install --lts \
    && nvm alias default lts/* \
    && npm install -g yarn


CMD ["zsh"]