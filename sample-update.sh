#! /bin/sh

# This is a sample file to get started with scheduling a cronjob for updating your wallpaper using the Python script.
echo "starting: $(date)"

# Replace with path to your wallpapers folder
export WALLPAPER_CAPTAIN_FOLDER=/path/to/your/wallpapers/

# Update the DBUS_SESSION_BUS_ADDRESS environment variable. Solution found on StackOverflow, but not able to find original link.
user=$(whoami)

fl=$(find /proc -maxdepth 2 -user $user -name environ -print -quit)
while [ -z $(grep -z DBUS_SESSION_BUS_ADDRESS "$fl" | cut -d= -f2- | tr -d '\000' ) ]
do
  fl=$(find /proc -maxdepth 2 -user $user -name environ -newer "$fl" -print -quit)
done

export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS "$fl" | cut -d= -f2-)

# Replace with path to your python script
python3 /path/to/the/python/script/wallpaper-updater.py
