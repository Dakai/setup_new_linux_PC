#export SDL_VIDEODRIVER=wayland 
#Wayland is still buggy

export SDL_VIDEODRIVER=X11

#scrcpy -b 4M -Sw -e --encoder 'OMX.google.h264.encoder' --window-width 400 --window-height 710 &
# google encoder is slow in responsiveness.

scrcpy -b 4M -Sw -e --encoder 'OMX.hisi.video.encoder.avc' --window-width 400 --window-height 710 
