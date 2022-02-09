#!/usr/bin/env bash

echo "Installing homebrew cask packages."

brew tap homebrew/cask

brew install 1password
#brew install avibrazil-rdm  # hack mac screen resolution
brew install alfred
brew install appcleaner
brew install authy
# brew install balenaetcher
brew install brave-browser
brew install caffeine
brew install clipy
# brew install daisydisk # analyzing disk space, requires license
brew install docker
# brew install dropbox
brew install notion
# brew install gitup
brew install goland
brew install google-chrome
brew install gpg-suite && sudo rm -rf /Library/Mail/Bundles/GPGMail.mailbundle
# small collection of dialog programs that allow GnuPG to read passphrases and PIN numbers in a secure manner
brew install pinentry-mac && echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
brew install intellij-idea-ce # intellij-idea for paid edition
brew install iterm2
brew install keybase
brew install meetingbar # meetings in the os bar
brew install ngrok
#brew install openoffice
brew install osxfuse && brew install sshfs # file handling capabilities via third-party file systems
brew install pycharm-ce # pycharm for paid edition
brew install rubymine
brew install slack
brew install sublime-text
brew install rectangle # window management app https://github.com/rxhanson/Rectangle
brew install the-unarchiver
brew install telegram
#brew install tor-browser
#brew install tunnelbear
#brew install tunnelblick
#brew install virtualbox
#brew install virtualbox-extension-pack
brew install visual-studio-code
#brew install vlc
#brew install yujitach-menumeters
brew install zoomus
#cask install sidestep # Securing public wifi
#cask install transmit # FTP client

echo "DONE Installing homebrew cask packages."
