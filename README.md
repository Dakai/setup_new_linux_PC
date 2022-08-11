# README

Scripts and dot files for setting up a new Fedora PC for my daily usage.

## Notes and Tweaks

### Fix Nautilus to Chrome drag n drop malfunction/issue

1. in Chrome, enter address: about:flags
2. Search 'ozone'
3. Change 'Preferred Ozone platform' to Wayland
4. **Do not click relaunch button**, close all Chrome windows and relaunch Chrome

### Fix Nautilus to MS-Edge drag n drop malfunction/issue

1. Edit Edge property in Alacarte Menu Editor
2. add the following flags in launching Edge command(gtk-version=4 to enable Fcitx5 in Edge Wayland, same as Chrome above)

   -enable-features=UseOzonePlatform -ozone-platform=wayland --gtk-version=4
