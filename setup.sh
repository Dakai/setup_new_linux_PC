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

#rpm -Uhv https://mkvtoolnix.download/fedora/bunkus-org-repo-2-4.noarch.rpm

dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

#install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

#Performance Tweak
if ! grep -q 'vm.swappiness=1' /etc/sysctl.conf; then
	bash -c 'echo "vm.swappiness=1" >> /etc/sysctl.conf'
	echo 'append "vm.swappiness=1" >> /etc/sysctl.conf'
fi

if ! grep -q 'vm.vfs_cache_pressure=50' /etc/sysctl.conf; then
	bash -c 'echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf'
	echo 'append "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf'
fi

sysctl -p /etc/sysctl.conf

dnf copr enable kwizart/fedy -y
dnf copr enable elxreno/preload -y
dnf copr enable dawid/better_fonts -y
dnf copr enable atim/zerotier-one -y

#insatll anydesk
rm /etc/yum.repos.d/AnyDesk-Fedora.repo

cat > /etc/ld.so.conf.d/gtk3.conf << "EOF"
/usr/lib64/gtk-3.0/modules
EOF
ldconfig
wget -c 'https://download.anydesk.com/linux/anydesk_6.2.0-1_x86_64.rpm' -P /tmp
rpm -ivh --nodeps /tmp/anydesk_6.2.0-1_x86_64.rpm
rm -f /tmp/anydesk_6.2.0-1_x86_64.rpm

wget https://download.copr.fedorainfracloud.org/results/dawid/better_fonts/fedora-34-x86_64/02077386-archivo-black-fonts/archivo-black-fonts-1.001-1.fc34.noarch.rpm
dnf install -y localinstall ./archivo-black-fonts-1.001-1.fc34.noarch.rpm
dnf install -y alacritty google-noto-sans-cjk-ttc-fonts google-noto-serif-cjk-ttc-fonts zsh wget vim neovim fedy preload fontconfig-font-replacements fontconfig-enhanced-defaults zerotier-one syncthing tmux proxychains-ng timeshift sublime-text alacarte fcitx5 fcitx5-autostart fcitx5-chinese-addons fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-qt-module ffmpeg libva libva-utils intel-media-driver 

touch /home/dakai/.pam_environment
#~/.xprofile for X11
cat > /home/dakai/.pam_environment << "EOF"
GTK_IM_MODULE=fcitx5
QT_IM_MODULE=fcitx5
XMODIFIERS="@im=fcitx5"
EOF
chown dakai:dakai /home/dakai/.pam_environment
ln ./fcitx5.desktop /home/dakai/.config/autostart/fcitx5.desktop
#git clone https://github.com/ryanoasis/nerd-fonts.git
#chmod +x ./nerd-fonts/install.sh
#./nerd-fonts/install.sh jetbrains
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
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

bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

if grep -q 'socks4 127.0.0.1' /etc/proxychains.conf ; then
	truncate -s -"$(tail -n1 /etc/proxychains.conf | wc -c)" /etc/proxychains.conf
	bash -c 'echo "socks5 127.0.0.1 10808" >> /etc/proxychains.conf'
fi

sudo systemctl enable zerotier-one.service
sudo systemctl start zerotier-one.service
echo -e "\n systemctl --user enable --now syncthing.service \n"

systemctl enable --now tailscaled
tailscale up


