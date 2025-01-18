# ベースイメージ
FROM ubuntu:22.04

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    zsh \
    curl \
    git \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 非 root ユーザーを作成
ARG USER=devuser
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $USER && \
    useradd -m -u $UID -g $GID -s /bin/zsh $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# ワークディレクトリを設定
WORKDIR /home/$USER

# 非 root ユーザーに切り替え
USER $USER
