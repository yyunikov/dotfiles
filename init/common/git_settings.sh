#!/usr/bin/env bash

echo "Configuring git."
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name "$FULL_NAME"
git config --global user.email "${EM}"
git config --global core.editor ${EDITOR}
git config --global core.filemode true
git config --global color.ui true
git config --global push.default simple
git config --global fetch.prune true
git config --global diff.colorMoved zebra
git config --global rebase.autostash true
git config --global rebase.autoSquash true

echo "Configuring git-delta pager."
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only --features=interactive"
git config --global delta.features decorations
git config --global delta.interactive.keep-plus-minus-markers false
git config --global delta.decorations.commit-decoration-style "blue ol"
git config --global delta.decorations.commit-style raw
git config --global delta.decorations.file-style omit
git config --global delta.decorations.hunk-header-decoration-style "blue box"
git config --global delta.decorations.hunk-header-file-style red
git config --global delta.decorations.hunk-header-line-number-style "#067a00"
git config --global delta.decorations.hunk-header-style "file line-number syntax"

git config --global alias.br "! git for-each-ref --sort='authordate' --format='%(refname)%09%(authordate)' refs/heads | sed -e 's-refs/heads/--' | tail"

git config --global gpg.program gpg
git config --global user.signingkey ${GPG_KEY}
git config --global commit.gpgSign true

# check
echo "Git settings:"
git config --list | tee
echo "Done configuring git."
