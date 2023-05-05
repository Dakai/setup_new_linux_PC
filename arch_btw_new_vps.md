Setup new Arch (BTW) VPS

## New User

```
pacman -S sudo vi
useradd {username}
passwd {username}
mkdir /home/{username}
chown {username}:{username} /home/{username}
```

### root privileges

```
groupadd sudo
usermod -aG sudo username
```

### config sudo group and let user sudo no passwd

```
echo "%sudo ALL=(ALL)" >> /etc/sudoers
echo "{username} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
```

### disable root login

```
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
```

### change ssh port

```
echo "Port {Port #}" >> /etc/ssh/sshd_config
```

### Open firewall to allow new port ssh inbound

```
ufw allow {Port #}
```

### restart sshd

```
sudo systemctl restart ssh
```

## Login with {username}

```
chsh -s /bin/bash
```

### make VPS recognize alacritty

```
wget https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info && tic -xe alacritty,alacritty-direct alacritty.info && rm alacritty.info
```

## install AI shell

### install nodeJS

```
sudo pacman -S nodejs npm yarn
```

### install YAI

```
sudo pacman -S curl
mkdir ~/.config
curl -sS https://raw.githubusercontent.com/ekkinox/yai/main/install.sh | bash
```
