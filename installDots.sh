#!/bin/sh
#set -x


# name of directory containing dotfiles checked out
dir=~/.dotfiles


cd ~

echo "deleting existing files and creating backups"
mv .bashrc .bashrc.bak
mv .vimrc .vimrc.bak

echo "creating sym links"
cd $dir
ln -s $dir/bashrc ~/.bashrc
ln -s $dir/vimrc ~/.vimrc

cd
mkdir -p ~/.vim/bundle

cd ~/.vim/bundle

echo "Installing vim plugins"

if [ ! -d "$HOME/.vim/bundle/nerdtree" ]; then
  echo "Cloning NERDTree"
  git clone https://github.com/scrooloose/nerdtree.git
fi

if [ ! -d "$HOME/.vim/bundle/ctrlp.vim" ]; then
  echo "Cloning CtrlP"
  git clone https://github.com/kien/ctrlp.vim.git
fi

if [ ! -d "$HOME/.vim/bundle/syntastic" ]; then
  echo "Cloning syntastic"
  git clone https://github.com/scrooloose/syntastic.git
fi

if [ ! -d "$HOME/.vim/bundle/vim-colors-solarized" ]; then
  echo "Cloning vim solarized"
  git clone git://github.com/altercation/vim-colors-solarized.git
fi

if [ ! -d "$HOME/.vim/bundle/YouCompleteMe" ]; then
  echo "Cloning YouCompleteMe"
  git clone https://github.com/Valloric/YouCompleteMe
fi

cd ~

# NOTE: further installation needed for syntastic, vundle, pathogen, and
# YouCompleteMe

