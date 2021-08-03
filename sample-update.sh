#! /bin/sh

# This is a sample file to get started with scheduling a cronjob for updating your wallpaper using the Python script. 
# In your crontab, there should be an entry as follows:
# @hourly /path/to/sample-update.sh >> /path/to/output.log 2>&1

# Determine the last execution time based on the output log and convert it to a date object. We are doing this because the cronjob is not guaranteed to run daily in case the computer is asleep during the scheduled time. Hence, we have set it to run hourly, and check against our logfile to deem if it is actually eligible to update the wallpaper.
last_execution_time=$(tail -1 path/to/output.log)
last_execution_time=$(date -d "$last_execution_time" +%s)

# Determine at most how recently the script could have been run last in order to be eligible. If it has been run too recently, then exit the program.
max_time_next_execution=$(date -d "-1 days" +%s)

if [ $last_execution_time -ge $max_time_next_execution ];
then
    exit 0
fi

# We will change the wallpaper! Log the date in the log file to keep track of the last run.
echo "$(date)"

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
