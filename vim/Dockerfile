FROM ubuntu:18.04
#Build args
ARG VCS_REF
ARG BUILD_DATE

LABEL maintainer="phuang07 <github.com/phuang07/dockerimgs>"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-url="https://github.com/phuang07/dockerimgs"
LABEL org.label-schema.vcs-ref=$VCS_REF

ENV \
        UID="1000" \
        GID="1000" \
        UNAME="docker" \
        GNAME="docker" \
        SHELL="/bin/bash" \
	NVIM_CONFIG="/home/docker/.config/nvim" \
	PATH="/home/docker/.local/bin:${PATH}"

# Existing lsb_release causes issues with modern installations of Python3
# https://github.com/pypa/pip/issues/4924#issuecomment-435825490
# Set (temporarily) DEBIAN_FRONTEND to avoid interacting with tzdata
RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
apt-utils \
curl \
sudo \
bash \
wget \
git \
python3 \
python3-pip \
python \
nodejs \
npm


RUN pip3 install pynvim
RUN ln -s /usr/bin/python /usr/local/bin/python
RUN ln -s /usr/bin/python3 /usr/local/bin/python3

# Create user "docker" with sudo powers
RUN useradd -m "${UNAME}" && \
    usermod -aG sudo "${UNAME}" && \
    echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    cp /root/.bashrc /home/"${UNAME}"/ && \
    mkdir /home/"${UNAME}"/.config && \
    chown -R --from=root "${UNAME}" /home/"${UNAME}"


# Install neovim from appimg, because I want a higher version of neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage && \
    chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract && \
    mv squashfs-root nvim && \
    chmod -R 755 nvim

COPY ./config /home/$UNAME/.config

# Install vim-plug
RUN curl -fLo /home/"${UNAME}"/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


USER root
RUN chown -R --from=root "${UNAME}" /home/"${UNAME}"
WORKDIR /home/$UNAME

USER $UNAME
ENV PATH=$PATH:/nvim/usr/bin
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install

RUN nvim --headless +"PlugInstall" +qall

