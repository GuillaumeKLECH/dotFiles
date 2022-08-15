#!/bin/bash

#sudo xcode-select --install

# Install Brew!
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-fonts

# Install casks for communication / utilities
brew install --cask  google-chrome \
			        slack \
				whatsapp \
				signal \
			        zoom \
				visual-studio-code \
			        iterm2 \
			        drawio \
				clipy \
				font-hack-nerd-font \
				session-manager-plugin \
				adobe-acrobat-reader \
				mambaforge \
				postman \
				cyberduck

# Install packages for dev using Brew
brew install 	zsh \
		        awscli \
		        jq \
		        python \
		        python-yq \
			pinentry-mac \
			gpg2 \
		        gabrie30/utils/ghorg \
			asdf \
			direnv \
			nvim \
			ripgrep \
			bat \
			defaultbrowser \
			tree \
			pandoc \
			cheat \
			git-delta \
			git-crypt \
			exa \
			starship \
			dust \
			sd \
			procs \
			tealdeer

# Make zsh default shell
if [ ! "$SHELL" -e "/bin/zsh" ]; then
	chsh -s $(which zsh)
fi

