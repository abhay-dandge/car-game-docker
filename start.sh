#!/bin/bash
Xvfb :1 -screen 0 "$SCREEN" -nolisten tcp &
sleep 2
openbox &
x11vnc -display :1 -forever -shared -nopw -quiet -rfbport 5900 -wait 10 -defer 10 &
websockify --web /usr/share/novnc 6080 localhost:5900 &
# Restart the game automatically if it's closed or crashes
while true; do
  /usr/games/supertuxkart --windowed --screensize=640x480
  sleep 2
done
