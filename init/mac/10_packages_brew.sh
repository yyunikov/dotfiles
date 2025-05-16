#!/usr/bin/env bash

echo "Installing homebrew packages."

if ! command -v brew 2>/dev/null; then
    sudo xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
brew doctor

brew install asciinema
brew install awscli@2
brew install awsume
brew install aws-rotate-key
brew install aws-iam-authenticator
brew install bash
# brew install blueutil # cli tool for bluetooth
brew install curl
brew install colordiff
# brew install daemon # turns other process into daemons
brew install direnv # load and unload environment variables depending on the current directory
# brew install exiftool # Perl lib for reading and writing EXIF metadata
# brew install flatbuffers # Serialization library for C++, supporting Java, C#, and Go
brew install git
brew install git-gui
brew install git-delta
brew install gh
brew install grpcurl
# GNU internationalization (i18n) and localization (l10n) library
brew install --force gettext # envsubst
brew link --force gettext
# brew install gnu-tar # GNU version of the tar archiving utility
brew install gpg
# brew install gcc # GNU compiler collection
brew install go
brew install goenv
brew install htop-osx # improved top
brew install hstr
# brew install iperf # Tool to measure maximum TCP and UDP bandwidth
# brew install iperf3 # Update of iperf: measures TCP, UDP, and SCTP bandwidth
brew install python-yq # Command-line YAML and XML processor that wraps jq
brew install --HEAD jq
brew install hub
brew install fzf
brew install kafkacat
brew install kubernetes-cli
brew install kubernetes-helm
brew install kubectx
brew install txn2/tap/kubefwd
# brew install mc # Input method for Bopomofo (Phonetic Symbols of Mandarin Chinese)
brew install maven
brew install micro
brew install mas
brew install mtr # https://medium.com/macos-sh/mtr-my-traceroute-replacement-7827bd8efa42
brew install nmap
brew install nvm ; mkdir $HOME/.nvm
brew install ollama
brew install openssl
# brew install packer # Tool for creating identical machine images for multiple platforms
brew install postgresql
brew install protobuf
# brew install perl
brew install pv # Pipeline view https://catonmat.net/unix-utilities-pipe-viewer
brew install pyenv
brew install rbenv
brew install romkatv/powerlevel10k/powerlevel10k
# brew install travis
brew install serverless
brew install ssh-copy-id
brew install stern
brew install telnet
brew install tfenv
brew install tgenv
# brew install vault # HashiCorp Vault
brew install vim
# brew install wakeonlan # Sends magic packets to wake up network-devices
brew install watch
brew install wget
brew install youtube-dl && brew install ffmpeg
brew install zsh
brew install zsh-syntax-highlighting
brew install z # Tracks most-used directories to make cd smarter

echo "DONE Installing homebrew packages."
