#!/usr/bin/env bash

echo "Started initialization process."

if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="mac"
else
    echo "Cannot determine the OS"
    exit 1
fi
echo "Detected OS: ${OS}"

source ./vars.sh

echo "Installing dotfiles:"
for f in $(ls -d $(pwd)/dotfiles/.?* | grep -v "^/.$" | grep -v "/..$"); do
    ln -sf $f ~/
done
echo "DONE Installing dotfiles"

echo "Installing ${OS} scripts:"
for f in $(ls ./init/${OS}/); do
    bash ./init/${OS}/${f}
done
echo "DONE Installing ${OS} scripts"

echo "Installing common scripts:"
bash ./init/common/setup_zsh.sh
bash ./init/common/git_settings.sh
echo "DONE Installing common scripts"

echo "Finished initialization process."