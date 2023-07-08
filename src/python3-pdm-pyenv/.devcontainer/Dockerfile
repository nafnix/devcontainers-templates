FROM mcr.microsoft.com/devcontainers/base:${templateOption:imageVariant}

ARG DEBIAN_FRONTEND=noninteractive
ARG USER=vscode
RUN apt update \
    && apt install -y --no-install-recommends curl wget git zsh sudo build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && usermod -s /usr/bin/zsh ${USER}

USER ${USER}
ARG HOME="/home/${USER}"
WORKDIR ${HOME}

ARG PYTHON_VERSION=${templateOption:pythonVersion}
ENV PYENV_ROOT=${HOME}/.pyenv
ARG PYENV_PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims"
ARG PDM_PATH="${HOME}/.local/bin"
ENV PATH="${PYENV_PATH}:${PDM_PATH}:$PATH"
RUN set -x \
    && curl http://pyenv.run | bash \
    && echo 'eval "$(pyenv init -)"' >>${HOME}/.zshrc \
    && pyenv install -v ${PYTHON_VERSION} \
    && pyenv global ${PYTHON_VERSION}

RUN curl -sSLO https://pdm.fming.dev/dev/install-pdm.py \
    && curl -sSL https://pdm.fming.dev/dev/install-pdm.py.sha256 | shasum -a 256 -c - \
    && python install-pdm.py \
    && rm install-pdm.py \
    && mkdir ${HOME}/.zfunc \
    && pdm completion zsh >${HOME}/.zfunc/_pdm \
    && echo 'fpath+=${HOME}/.zfunc' >>${HOME}/.zshrc \
    && echo 'autoload -Uz compinit && compinit' >>${HOME}/.zshrc
