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

dnf -y install git
dnf -y install vim
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

dnf -y install neovim

dnf copr enable kwizart/fedy -y
dnf install fedy -y

dnf copr enable elxreno/preload -y
dnf install preload -y

dnf copr enable dawid/better_fonts
dnf install fontconfig-font-replacements -y
dnf install fontconfig-enhanced-defaults -y

dnf copr enable atim/zerotier-one -y
dnf install zerotier-one -y

dnf install syncthing
systemctl enable --now syncthing@USER.service

dnf install tmux -y

bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

dnf install proxychains-ng -y
truncate -s -"$(tail -n1 /etc/proxychains.conf | wc -c)" /etc/proxychains.conf
bash -c 'echo "socks5 127.0.0.1 10808" >> /etc/proxychains.conf'

dnf install timeshift -y

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
dnf install anydesk

#install tailscale
dnf config-manager --add-repo https://pkgs.tailscal .com/stable/fedora/tailscale.repo\

dnf install tailscale
systemctl enable --now tailscaled
tailscale up
