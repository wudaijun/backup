#!/bin/bash

path=$PWD

echo '>> Init Bundle ...'
vundle_path=$path/vim/bundle/vundle
if ! [ -d $vundle_path/.git ]; then
	if [ -d $vundle_path ]; then
		rm -rf $vundle_path
	fi
	git clone https://github.com/gmarik/vundle.git $vundle_path
fi

echo '>> Process Bundle ...'
vim +BundleInstall +qa

echo '>> Process YCM ...'
ycm_path=$path/vim/bundle/YouCompleteMe
brew install cmake
$ycm_path/install.sh --clang-completer
rm -rf ~/.ycm_extra_conf.py
ln -s $path/plugin_config/ycm_extra_conf.py ~/.ycm_extra_conf.py

echo '>> Link vim ...'

rm -rf ~/.vim
rm -rf ~/.vimrc
ln -s $path/vim 		~/.vim
ln -s $path/vimrc		~/.vimrc
