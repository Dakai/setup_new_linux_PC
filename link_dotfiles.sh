#Check if user is root
if [ "$EUID" -ne 0 ]
then
	echo -e "\n You need to be root user or run with sudo \n"
	exit
else
	echo -e "\n You have proper permissions, continue\n"
fi

#su dotfiles
#setup Vim
#mkdir -p /root/.vim /root/.vim/autoload /root/.vim/backup /root/.vim/colors /root/.vim/plugged
#curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#ln -s /home/dakai/setup_new_fedora_PC/vimrc /root/.vimrc
#
##Setup neovim
#mkdir -p /root/.config/nvim
#ln -s /home/dakai/setup_new_fedora_PC/coc-settings.json /root/.config/nvim/coc-settings.json
#ln -s /home/dakai/setup_new_fedora_PC/coc.vim /root/.config/nvim/coc.vim
#ln -s /home/dakai/setup_new_fedora_PC/init.vim /root/.config/nvim/init.vim
#ln -s /home/dakai/setup_new_fedora_PC/plug.vim /root/.config/nvim/plug.vim
