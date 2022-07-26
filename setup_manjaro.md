# Manjaro setup

### Setup Pacman mirror location

    pacman-mirrors -c United_States

or

    pacman-mirror -c South_Korea

### Update system

    sudo pacman -Syyu

### Enable AUR

    sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf

### install yay

    sudo pacman -S yay --noconfirm

### Enable Chaotic AUR Repo

https://aur.chaotic.cx/

### restore packages from pacman.lst

    cat ./pacman.lst | xargs yay -S --needed --noconfirm

#### how to generate pacman.lst

    pacman -Qqe | grep -v "$(pacman -Qqm)" > pacman.lst

### setup overview shorcut key to Meta (Optional)

    kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Overview"
    qdbus org.kde.KWin /KWin reconfigure

### setup application luancher shorcut key to Meta (Optional)

    kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.plasmashell,/PlasmaShell,org.kde.PlasmaShell,activateLauncherMenu"
    qdbus org.kde.KWin /KWin reconfigure

### setup tmux

#### install plugin manager

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#### install tmux resurrected

add plugin to tmux.conf

    set -g @plugin 'tmux-plugins/tmux-resurrect'

Hit prefix + I(ctrl+B, shift+i) to fetch the plugin and source it. You should now be able to use the plugin.

### Install fonts and configuration

    yay -S ttf-twemoji ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-2048-em ttf-jetbrians-mono noto-fonts noto-fonts-cjk
    rm ~/.config/fontconfig/fonts.conf
    ln ./fonts.conf ~/.config/fontconfig/fonts.conf

### Embark Theme for Konsole

    ln ./Embark.colorscheme ~/.local/share/konsole/Embark.colorscheme

### Neovim Plugin Manager

    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    mkdir -p /home/dakai/.config/nvim
    ln ./coc-settings.json /home/dakai/.config/nvim/coc-settings.json
    ln ./coc.vim /home/dakai/.config/nvim/coc.vim
    ln ./init.vim /home/dakai/.config/nvim/init.vim
    ln ./plug.vim /home/dakai/.config/nvim/plug.vim
