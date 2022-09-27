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

#Setup Pacman mirror location
pacman-mirrors -c United_States
#pacman-mirror -c South_Korean

#Update system
pacman -Syyu

#Enable AUR
sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf

#install yay
pacman -S yay --noconfirm

