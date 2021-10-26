#!/bin/bash

# Install Brew!
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install casks for CACD2 communication / utilities
brew install --cask  google-chrome \
			        firefox \
			        microsoft-office \
                    microsoft-teams \
			        skype-for-business \
			        slack \
			        zoomus \
			        dashlane


# Install casks for dev
brew install --cask	visual-studio-code \
			        iterm2 \
			        intellij-idea-ce \
			        drawio \
				ngrok \ 
				tunnelblick 

# Install packages for dev using Brew
brew install 	zsh \
		        awscli \
		        aws-iam-authenticator \
		        jq \
		        yq \
		        vault \
		        python \
				docker \
				docker-machine \
				docker-compose \
				kubectl \
				pinentry-mac \
				gpg2 \
		        gabrie30/utils/ghorg \
				helm

# Make zsh default shell
if [ ! "$SHELL" -e "/bin/zsh" ]; then
	chsh -s $(which zsh)
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sed 's/^plugins=.*/plugins=(git dotenv docker kubectl common-aliases helm jira otp colorize)/' ~/.zshrc > ~/.zshrc-tmp
sed 's/ZSH_THEME=.*/ZSH_THEME="robbyrussell"/g' ~/.zshrc-tmp > ~/.zshrc
echo "DEFAULT_USER=$USER" >> ~/.zshrc

# Other dev tools
pip3 install virtualenv aws-mfa

# Install packages for dev-ops only
brew install    tfenv \
				az


################################################
#	Clone gitlab CACD2 repositories
################################################

# Create SSH key if not exists
[ -f ~/.ssh/id_rsa ] && echo "Skip SSH key creation" || ssh-keygen -t rsa

echo "Ensure your public key is registered at https://gitlab.com/profile/keys"
read -p "Press RETURN to continue"
ssh -T git@gitlab.com

echo "Ensure you created a personal access token with read permissions at https://gitlab.com/profile/personal_access_tokens"

if [ ! -f ~/.gitlab-token ]; then
	read -sp 'Please provide your gitlab token :' GITLAB_TOKEN
	echo $GITLAB_TOKEN > ~/.gitlab-token
fi

GITLAB_TOKEN=$(cat ~/.gitlab-token)
ghorg clone cacd2 --scm=gitlab --token=$GITLAB_TOKEN --preserve-dir --protocol ssh --skip-archived --path ~/
