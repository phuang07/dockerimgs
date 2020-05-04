#!/usr/bin/env bash

set -e

function install_node () {
    # cd $HOME
    # mkdir .nvm
    # https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04
    printf "\n### Downloading Nodejs. Version: ${1}\n"
    curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh -o install_nvm.sh
    bash install_nvm.sh
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo "echo 'I am in the bashrc'" >> ~/.bashrc
    echo "echo 'I am in the profile'" >> ~/.profile
    source ~/.bashrc
    source ~/.profile
    nvm install ${1}
    nvm alias default ${1}
    nvm use default
    rm install_nvm.sh
    which npm
    which node
    # cd -
}

function install_npm_packages() {
    npm install -g gulp 
}

function main() {
    NODE_VERSION_TAG=12.16.3
    
    if [[ $# -gt 0 ]]; then
        NODE_VERSION_TAG="${1}"
    fi

    install_node "${NODE_VERSION_TAG}"
    install_npm_packages
}

main "$@" || exit 1

