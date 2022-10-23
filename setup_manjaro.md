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

### restore packages from pacman.lst

    cat ./pacman.lst | xargs yay -S --needed --noconfirm

#### how to generate pacman.lst

      pacman -Qqe | grep -v "$(pacman -Qqm)" > pacman.lst

### setup overview shorcut key to Meta (Optional)

    kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Overview"
    qdbus org.kde.KWin /KWin reconfigure

### setup tmux

#### install plugin manager

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#### install tmux resurrected

add plugin to tmux.conf

    set -g @plugin 'tmux-plugins/tmux-resurrect'

Hit prefix + I(ctrl+B, shift+i) to fetch the plugin and source it. You should now be able to use the plugin.
