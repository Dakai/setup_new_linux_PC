# Manjaro setup

### Setup Pacman mirror location

    pacman-mirrors -c United_States

or

    pacman-mirror -c South_Korean

### Update system

    sudo pacman -Syyu

### Enable AUR

    sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf

### install yay

    sudo pacman -S yay --noconfirm

### install nerd fonts

### setup overview shorcut key

    kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Overview"
    qdbus org.kde.KWin /KWin reconfigure
