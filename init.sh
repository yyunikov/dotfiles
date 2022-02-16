#!/usr/bin/env bash

echo "Started initialization process."

source ./vars.sh

echo "Installing mac scripts:"
for f in $(ls ./init/mac/); do
    bash ./init/mac/${f}
done
echo "DONE Installing mac scripts"

echo "Installing dotfiles:"
for f in $(ls -d $(pwd)/dotfiles/.?* | grep -v "^/.$" | grep -v "/..$"); do
    ln -sf $f ~/
done
echo "DONE Installing dotfiles"

echo "Installing common scripts:"
bash ./init/common/setup_zsh.sh
bash ./init/common/git_settings.sh
echo "DONE Installing common scripts"

echo "Finished initialization process."
