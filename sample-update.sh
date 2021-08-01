#! /bin/sh

# This is a sample file to get started with scheduling a cronjob for updating your wallpaper using the Python script.
echo "starting: $(date)"

# Replace with path to your wallpapers folder
export WALLPAPER_CAPTAIN_FOLDER=/path/to/your/wallpapers/

# Update the DBUS_SESSION_BUS_ADDRESS environment variable. Solution found on StackOverflow, but I am not able to find the original link :(
# This is required to allow the terminal from which the cronjob runs to have access to the DBUS_SESSION_BUS_ADDRESS environment variable. 
# Without it, it's not able to save the new wallpaper to this display. 
# If you run the python script from a regular terminal, this environment variable will already be appropriately set. 
# The differential arises from the cronjob terminal using a more minimal set of environment variables.
user=$(whoami)

fl=$(find /proc -maxdepth 2 -user $user -name environ -print -quit)
while [ -z $(grep -z DBUS_SESSION_BUS_ADDRESS "$fl" | cut -d= -f2- | tr -d '\000' ) ]
do
  fl=$(find /proc -maxdepth 2 -user $user -name environ -newer "$fl" -print -quit)
done

export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS "$fl" | cut -d= -f2-)

# Replace with path to your python script
python3 /path/to/the/python/script/wallpaper-updater.py
