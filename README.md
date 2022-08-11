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
2. add command

   -enable-features=UseOzonePlatform -ozone-platform=wayland
