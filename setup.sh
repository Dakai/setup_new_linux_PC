#!/bin/bash

#Check if user is root
if [ "$EUID" -ne 0 ]
then
	echo -e "\n You need to be root user or run with sudo \n"
	exit
else
	echo -e "\n You have proper permissions, continue\n"
fi

echo -e "\n Config dnf"
if ! grep -q 'minrate=30k' /etc/dnf/dnf.conf; then
	bash -c 'echo "minrate=30k" >> /etc/dnf/dnf.conf'
	echo 'minrate=30k >> /etc/dnf/dnf.conf'
fi

if ! grep -q 'defaultyes=True' /etc/dnf/dnf.conf; then
	bash -c 'echo "defaultyes=True" >> /etc/dnf/dnf.conf'
	echo 'defaultyes=True >> /etc/dnf/dnf.conf'
fi

if ! grep -q 'max_parallel_downloads=10' /etc/dnf/dnf.conf; then
	bash -c 'echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf'
	echo 'append max_parallel_downloads=10 >> /etc/dnf/dnf.conf'
fi

echo -e "\n System update"
dnf update -y

echo -e "\n Enable RPM Fusion"
rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Performance Tweak
bash -c 'echo "vm.swappiness=1" >> /etc/sysctl.conf'
bash -c 'echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf'
sysctl -p /etc/sysctl.conf

dnf copr enable kwizart/fedy -y
dnf copr enable elxreno/preload -y
dnf copr enable dawid/better_fonts
dnf copr enable atim/zerotier-one -y

#install tailscale
dnf config-manager --add-repo https://pkgs.tailscal .com/stable/fedora/tailscale.repo\

#insatll anydesk
cat > /etc/yum.repos.d/AnyDesk-Fedora.repo << "EOF"
[anydesk]
name=AnyDesk Fedora - stable
baseurl=http://rpm.anydesk.com/fedora/$basearch/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
EOF

cat > /etc/ld.so.conf.d/gtk3.conf << "EOF"
/usr/lib64/gtk-3.0/modules
EOF
ldconfig

dnf install -y alacritty google-noto-sans-cjk-ttc-fonts google-noto-serif-cjk-ttc-fonts zsh wget vim neovim fedy preload fontconfig-font-replacements fontconfig-enhanced-defaults zerotier-one syncthing tmux proxychains-ng timeshift anydesk tailscale

git clone https://github.com/ryanoasis/nerd-fonts.git
chmod +x ./nerd-fonts/install.sh
./nerd-fonts/install.sh jetbrains

#setup Vim
mkdir -p /home/dakai/.vim /home/dakai/.vim/autoload /home/dakai/.vim/backup /home/dakai/.vim/colors /home/dakai/.vim/plugged
curl -fLo /home/dakai/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln ./.vimrc /home/dakai/.vimrc

#Setup neovim
mkdir -p /home/dakai/.config/nvim
ln ./coc-settings.json /home/dakai/.config/nvim/coc-settings.json
ln ./coc.vim /home/dakai/.config/nvim/coc.vim
ln ./init.vim /home/dakai/.config/nvim/init.vim
ln ./plug.vim /home/dakai/.config/nvim/plug.vim

#Setup Alacritty
mkdir -p /home/dakai/.config/alacritty
ln ./alacritty.yml /home/dakai/.config/alacritty/alacritty.yml 

systemctl enable --now syncthing@USER.service

bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

truncate -s -"$(tail -n1 /etc/proxychains.conf | wc -c)" /etc/proxychains.conf
bash -c 'echo "socks5 127.0.0.1 10808" >> /etc/proxychains.conf'

systemctl enable --now tailscaled
tailscale up
