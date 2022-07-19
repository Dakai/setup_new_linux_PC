#!/bin/bash

#Check if user is root
if [ "$EUID" -ne 0 ]
then
	echo -e "\n You need to be root user or run with sudo \n"
	exit
else
	echo -e "\n You have proper permissions, continue\n"
fi
#install KODI
dnf -y install kodi

#install Plex
cat > /etc/yum.repos.d/plex.repo << "EOF"
[Plexrepo]
name=plexrepo
baseurl=https://downloads.plex.tv/repo/rpm/$basearch/
enabled=1
gpgkey=https://downloads.plex.tv/plex-keys/PlexSign.key
gpgcheck=1
EOF

dnf install plexmediaserver -y
systemctl start plexmediaserver
systemctl enable plexmediaserver

systemctl status plexmediaserver

echo -e "\n Open http://localhost:32400/web for plexmediaserver GUI"


