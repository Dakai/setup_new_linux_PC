#!/bin/bash

#wget https://www.fontsquirrel.com/fonts/download/fira-sans-compressed

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
dnf copr enable zeno/scrcpy -y
dnf copr enable elxreno/preload -y
dnf copr enable dawid/better_fonts -y
dnf copr enable atim/zerotier-one -y

#insatll anydesk
wget https://download.opensuse.org/tumbleweed/repo/oss/x86_64/libgtkglext-x11-1_0-0-1.2.0git20110529-7.21.x86_64.rpm
wget https://download.opensuse.org/tumbleweed/repo/oss/i586/libgtkglext-x11-1_0-0-1.2.0git20110529-7.21.i586.rpm
dnf install -y libgtkglext-x11-1_0-0-1.2.0git20110529-7.20.x86_64.rpm
dnf install -y libgtkglext-x11-1_0-0-1.2.0git20110529-7.20.i586.rpm

cat > /etc/ld.so.conf.d/gtk3.conf << "EOF"
/usr/lib64/gtk-3.0/modules
EOF
ldconfig

cat > /etc/yum.repos.d/AnyDesk-Fedora.repo << "EOF"
[anydesk]
name=AnyDesk Fedora - stable
baseurl=http://rpm.anydesk.com/fedora/$basearch/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
EOF

dnf install anydesk -y

wget https://download.copr.fedorainfracloud.org/results/dawid/better_fonts/fedora-34-x86_64/02077386-archivo-black-fonts/archivo-black-fonts-1.001-1.fc34.noarch.rpm
dnf install -y localinstall ./archivo-black-fonts-1.001-1.fc34.noarch.rpm

#install Microsoft Edge for it has much better RAM usage
rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
sudo dnf update --refresh

dnf install -y alacritty google-noto-sans-cjk-ttc-fonts google-noto-serif-cjk-ttc-fonts zsh wget vim neovim fedy preload fontconfig-font-replacements fontconfig-enhanced-defaults zerotier-one syncthing tmux proxychains-ng timeshift sublime-text alacarte fcitx5 fcitx5-autostart fcitx5-chinese-addons fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-qt-module ffmpeg libva libva-utils intel-media-driver wqy-zenhei-fonts net-tools microsoft-edge-stable rpm-build ttmkfdir cabextract cups hplip hplip-gui levien-inconsolata-fonts mozilla-fira-sans-fonts scrcpy nodejs

#install ms fonts
mkdir -p $HOME/rpmbuild/{RPMS/noarch,BUILD}
echo '_topdir' > ~/.rpmmacros
wget https://gist.githubusercontent.com/ervinb/f5042369a1447fedc804a09d87e60997/raw/msttcorefonts-2.5-1.spec
rpmbuild -bb msttcorefonts-2.5-1.spec
dnf install -y ~/rpmbuild/RPMS/noarch/msttcorefonts-2.5-1.noarch.rpm

touch /home/dakai/.pam_environment
#~/.xprofile for X11
cat > /home/dakai/.pam_environment << "EOF"
GTK_IM_MODULE=fcitx5
QT_IM_MODULE=fcitx5
XMODIFIERS="@im=fcitx5"
EOF
chown dakai:dakai /home/dakai/.pam_environment
ln ./fcitx5.desktop /home/dakai/.config/autostart/fcitx5.desktop

#nerdfont jetBrains Mono
wget -c https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -P /tmp
unzip /tmp/JetBrainsMono.zip "JetBrains Mono Regular Nerd Font Complete Mono.ttf" -d /tmp
mv /tmp/"JetBrains Mono Regular Nerd Font Complete Mono.ttf" /home/dakai/.local/share/fonts
rm -f /tmp/JetBrainsMono.zip

#setup Vim
mkdir -p /home/dakai/.vim /home/dakai/.vim/autoload /home/dakai/.vim/backup /home/dakai/.vim/colors /home/dakai/.vim/plugged
curl -fLo /home/dakai/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln ./.vimrc /home/dakai/.vimrc
chown -R dakai:dakai /home/dakai/.vim
chown dakai:dakai /home/dakai/.vimrc

#Setup neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p /home/dakai/.config/nvim
ln ./coc-settings.json /home/dakai/.config/nvim/coc-settings.json
ln ./coc.vim /home/dakai/.config/nvim/coc.vim
ln ./init.vim /home/dakai/.config/nvim/init.vim
ln ./plug.vim /home/dakai/.config/nvim/plug.vim

#Setup Alacritty
mkdir -p /home/dakai/.config/alacritty
ln ./alacritty.yml /home/dakai/.config/alacritty/alacritty.yml
chown -R dakai:dakai /home/dakai/.config/

#su dotfiles

#install Xray
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

if grep -q 'socks4 127.0.0.1' /etc/proxychains.conf ; then
	truncate -s -"$(tail -n1 /etc/proxychains.conf | wc -c)" /etc/proxychains.conf
	bash -c 'echo "socks5 127.0.0.1 10808" >> /etc/proxychains.conf'
fi

sudo systemctl enable zerotier-one.service
sudo systemctl start zerotier-one.service
echo -e "\n systemctl --user enable --now syncthing.service \n"

#stop Gnome-software and packagekitd from autostarting because of their huge RAM usage
dconf write /org/gnome/software/allow-updates false
dconf write /org/gnome/software/download-updates false
mkdir -pv ~/.config/autostart && cp /etc/xdg/autostart/org.gnome.Software.desktop ~/.config/autostart/
echo "X-GNOME-Autostart-enabled=false" >> ~/.config/autostart/org.gnome.Software.desktop
dconf write /org/gnome/desktop/search-providers/disabled "['org.gnome.Software.desktop']"

#enable talscaled
systemctl enable --now tailscaled
tailscale up
