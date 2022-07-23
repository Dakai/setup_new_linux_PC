#!/usr/bin/env bash

set -e

v2ray_folder="/usr/local/share/xray"

GREEN='\033[0;32m'
NC='\033[0m'

GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat"

echo -e "${GREEN}>>> change directory...${NC}"
cd $v2ray_folder

echo -e "${GREEN}>>> delete old dat files...${NC}"
mv geoip.dat geoip.bak
mv geosite.dat geosite.bak
#rm -f geoip.dat geosite.dat

echo -e "${GREEN}>>> downloading geoip.dat files...${NC}"
curl -L -O $GEOIP_URL

echo -e "${GREEN}>>> downloading geosite.dat files...${NC}"
curl -L -O $GEOSITE_URL

systemctl restart xray.service
echo -e "${GREEN}完成啦！${NC}"
