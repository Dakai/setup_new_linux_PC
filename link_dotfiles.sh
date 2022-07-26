#setup Vim
mkdir -p /home/dakai/.vim /home/dakai/.vim/autoload /home/dakai/.vim/backup /home/dakai/.vim/colors /home/dakai/.vim/plugged
curl -fLo /home/dakai/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln ./.vimrc /home/dakai/.vimrc
chown -R dakai:dakai /home/dakai/.vim
chown dakai:dakai /home/dakai/.vimrc

#Setup neovim
mkdir -p /home/dakai/.config/nvim
ln ./coc-settings.json /home/dakai/.config/nvim/coc-settings.json
ln ./coc.vim /home/dakai/.config/nvim/coc.vim
ln ./init.vim /home/dakai/.config/nvim/init.vim
ln ./plug.vim /home/dakai/.config/nvim/plug.vim

#Setup Alacritty
mkdir -p /home/dakai/.config/alacritty
ln ./alacritty.yml /home/dakai/.config/alacritty/alacritty.yml
chown -R dakai:dakai /home/dakai/.config/


