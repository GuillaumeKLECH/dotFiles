# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install powerlevel10k 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh auto completion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh conda/mamba auto completion
git clone https://github.com/esc/conda-zsh-completion ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion

# install dein (vim package manager)
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.dein

# link pinentry-mac to gpg
mkdir ~/.gnupg/
echo "pinentry-program /usr/local/bin/pinentry-mac" >> $HOME/.gnupg/gpg-agent.conf

# set default browser
defaultbrowser chrome

################################################
# ssh config
################################################

# Create SSH key if not exists
ssh-keygen -t ed25519

