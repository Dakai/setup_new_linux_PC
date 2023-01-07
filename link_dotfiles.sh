mkdir -p /home/dakai/.config/nvim
ln -s /home/dakai/setup_new_fedora_PC/nvim/coc-settings.json /home/dakai/.config/nvim/coc-settings.json
ln -s /home/dakai/setup_new_fedora_PC/nvim/coc.vim /home/dakai/.config/nvim/coc.vim
ln -s /home/dakai/setup_new_fedora_PC/nvim/init.vim /home/dakai/.config/nvim/init.vim
ln -s /home/dakai/setup_new_fedora_PC/nvim/plug.vim /home/dakai/.config/nvim/plug.vim
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
#Setup neovim
mkdir -p /root/.config/nvim
ln -s /home/dakai/setup_new_fedora_PC/nvim/coc-settings.json /root/.config/nvim/coc-settings.json
ln -s /home/dakai/setup_new_fedora_PC/nvim/coc.vim /root/.config/nvim/coc.vim
ln -s /home/dakai/setup_new_fedora_PC/nvim/init.vim /root/.config/nvim/init.vim
ln -s /home/dakai/setup_new_fedora_PC/nvim/plug.vim /root/.config/nvim/plug.vim
