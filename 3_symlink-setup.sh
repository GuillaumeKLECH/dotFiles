#!/bin/bash
mkdir -p ~/.config/nvim
mkdir -p ~/.config/direnv

ln -s -f $PWD/.config/nvim/init.vim ~/.config/nvim/init.vim

ln -s -f $PWD/.config/direnv/direnvrc ~/.config/direnv/direnvrc


ln -s -f $PWD/.gitconfig ~/

ln -s -f $PWD/.gitexcludes ~/

ln -s -f $PWD/.p10k.zsh ~/

ln -s -f $PWD/.zshrc ~/

ln -s -f $PWD/.zshenv ~/
