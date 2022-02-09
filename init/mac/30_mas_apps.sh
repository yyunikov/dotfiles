#!/usr/bin/env bash

echo "Installing apps from the App Store."

mas install $(mas search Monosnap | awk 'NR==1{print $1}')

echo "DONE Installing homebrew cask packages."
