# This script backs up the world using 7zip
cd /home/dio/Minecraft\ Server/
NOW=$( date '+%F_%H:%M:%S' )
7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $NOW.7z world
mv $NOW.7z world_backups
