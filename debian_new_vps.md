# Setup new Debian VPS

## New User

```
useradd {username}
passwd {username}
mkdir /home/{username}
chown {username}:{username} /home/{username}
```

### root privileges

```
usermod -aG sudo username
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

### user sudo no passwd

```
echo "{username} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
```

### make VPS recognize alacritty

```
wget https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info && tic -xe alacritty,alacritty-direct alacritty.info && rm alacritty.info
```

## install AI shell

### install nodeJS

```
curl -sL https://deb.nodesource.com/setup_19.x | sudo -E bash -
```

#### install yarn

```
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get install yarn
```

### install ai-shell

`npm install -g @builder.io/ai-shell`

```

```
