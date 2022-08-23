export SDL_VIDEODRIVER=wayland
scrcpy -b 4M -Sw -e --encoder 'OMX.google.h264.encoder' --power-off-on-close --window-width 400 --window-height 710 &
