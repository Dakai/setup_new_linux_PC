#!/usr/bin/env bash

#Extract ID of touchpad device

DEVICE_ID=`xinput list | grep -i Touchpad | grep -oP "id=\S+" | cut -d"=" -f2`

PARAMETER_ID=`xinput list-props $DEVICE_ID | grep "Natural Scrolling Enabled (" | grep -oP "(\S+)" | awk -F'[()]' '{print $2}'`

# set the parameter to the proper value

xinput set-prop $DEVICE_ID $PARAMETER_ID 1
