#!/usr/bin/env bash

echo "Installing apps from cURL."

# poetry
curl -sSL https://install.python-poetry.org | python3 -

# sdkman
curl -s "https://get.sdkman.io?rcupdate=false" | bash

download_and_install_dmg() {
	curl -s -L "$1" --output tmp/$2.dmg
	sudo hdiutil attach tmp/$2.dmg
	# installer doesn't work since can't easily find out Volume name
	# will need to detach manually in the meantime

	# sudo installer -package /Volumes/$2/$2.pkg -target /
	# sudo hdiutil detach tmp/$2.dmg
}

# temp dir
mkdir tmp

# Postico 2
download_and_install_dmg https://releases.eggerapps.at/postico2/download postico
# Docker for Mac
download_and_install_dmg https://desktop.docker.com/mac/main/amd64/Docker.dmg docker

# remove temp dir
rm -rf tmp

echo "DONE Installing apps from cURL."
