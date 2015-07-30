echo '>> Init oh_my_zsh ...'
if ! [ -d ~/.oh-my-zsh/.git ]; then
	if [ -d ~/.oh-my-zsh ]; then
	   rm -rf ~/.oh-my-zsh
   	fi
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo '>> Copy zsh theme ...'
ln -s $PWD/mytheme.zsh-theme ~/.oh-my-zsh/themes/mytheme.zsh-theme
echo '>> Link zsh...'
rm ~/.zshrc
ln -s $PWD/zshrc ~/.zshrc
source ~/.zshrc
echo '>> Link tmux ...'
rm ~/.tmux.conf
ln -s $PWD/tmux.conf ~/.tmux.conf
