FROM mcr.microsoft.com/devcontainers/base:${templateOption:imageVariant}

ARG DEBIAN_FRONTEND=noninteractive USER=vscode

RUN DEBIAN_FRONTEND=${DEBIAN_FRONTEND} \
    && apt-get update \
    && apt-get install -y --no-install-recommends curl wget ca-certificates git unar zsh gcc make zlib1g zlib1g-dev libffi-dev libssl-dev libbz2-dev libsqlite3-dev lzma \
    && usermod -s /bin/zsh vscode

USER ${USER}
ARG HOME="/home/${USER}"
ARG PYTHON_VERSION=${templateOption:pythonVersion}
ENV PYENV_ROOT=${HOME}/.pyenv
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${HOME}/.local/bin:$PATH"

RUN curl https://pyenv.run | bash \
    && pyenv install ${PYTHON_VERSION} -v \
    && pyenv global ${PYTHON_VERSION} \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >>${HOME}/.zshrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >>${HOME}/.zshrc \
    && echo 'eval "$(pyenv init -)"' >>${HOME}/.zshrc

RUN curl -sSL https://raw.githubusercontent.com/pdm-project/pdm/main/install-pdm.py | python3 - \
    && mkdir ${HOME}/.zfunc \
    && pdm completion zsh >${HOME}/.zfunc/_pdm \
    && echo 'fpath+=${HOME}/.zfunc' >>${HOME}/.zshrc \
    && echo 'autoload -Uz compinit && compinit' >>${HOME}/.zshrc \
    && pdm self add pylance
