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

### install nerd fonts

	yay -S nerd-fonts-hack ttf-wps-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts ttf-lato ttf-inconsolata2 noto-fonts-cjk --noconfirm --needed 

### install oh-my-zsh
 	
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && rm ~/.zshrc && ln ./.zshrc ~/.zshrc

### setup overview shorcut key to Meta

    kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Overview"
    qdbus org.kde.KWin /KWin reconfigure
