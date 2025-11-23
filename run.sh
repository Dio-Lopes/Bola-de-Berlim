#!/usr/bin/env sh
# Forge requires a configured set of both JVM and program arguments.
# Add custom JVM arguments to the user_jvm_args.txt
# Add custom program arguments {such as nogui} to this file in the next line before the "$@" or
#  pass them to this script directly

# Make a backup of the world using the current time as a name
NOW=$( date '+%F_%H:%M:%S' )

# Compress it using 7z and ultra compression
if [ "$1" = "-c" ]; then
    7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on $NOW.7z world
    mv $NOW.7z world_backups

    if [ $? -eq 0 ]; then
        echo "Succesfully backed up latest world."
        echo "Name: $NOW"
        java @user_jvm_args.txt @libraries/net/neoforged/neoforge/21.1.215/unix_args.txt
    else
        echo "Latest world backup was unsuccesful. Halt."
    fi
else
    java @user_jvm_args.txt @libraries/net/neoforged/neoforge/21.1.215/unix_args.txt
fi


