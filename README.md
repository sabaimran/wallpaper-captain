# Wallpaper Captain!
I want to use wallpapers that mean something to me. At first iteration, I'll set the wallpaper to a random picture from a folder in which I keep photos from various occasions in my life. Each random photo allows me to think back to a different time, state, or place I was in, and to serendipitously live the joy of that moment again.

Over time, I would like to increase the complexity of how the next wallpaper is decided, but this would suffice for now :). For any comments, problems, or suggestions, please peruse the [Issues](https://github.com/sabaimran/wallpaper-captain/issues), which I will monitor actively.

## Checkout

Checkout using `git checkout https://github.com/sabaimran/wallpaper-captain.git`.

## Prerequisites

### Photos
Assemble a directory of photos on your machine, comprised of photos you'd like to use as the source for your wallpapers. You can add and remove as you'd like, without consequence to the script execution. However, you should ensure that your photos are of type `.jpeg`, `.jpg`, `.png`, or some other image type which can be used for wallpaper settings. 

Do you need ideas of which photos to use? I have used many photos from my travels, ventures into nature, scenes around places I've lived. Try to use photos that elicit positive feelings from you, no matter the time of day, week, month, or year! Goats 🐐️, strelitzia 🥀️, the Bukingham Fountain ⛲️, Mount Rainier 🏔️.

## Manual Execution

These instructions pertain to those who want to trigger the script from the normal terminal environment. You can refer to [this article](https://devconnected.com/set-environment-variable-bash-how-to/) for more details on environment variables in Ubuntu. For scheduling instructions, you can refer to [the scheduling section](https://github.com/sabaimran/wallpaper-captain#scheduling).

### Environment

Before running the script, you must set the relevant environment variable which indicates to the script where the folder of the wallpapers you created in the step prior lives. Below are two methods highlighted to accomplishing this, if you're new to environment variables:

- `export WALLPAPER_CAPTAIN_FOLDER=/path/to/wallpapers/folder/`
  - If you want to set the environment variable for the lifetime of the terminal, you can use this command inside the terminal you will use to run the script.

- Add `export WALLPAPER_CAPTAIN_FOLDER=/path/to/wallpapers/folder/` to `~/.bashrc`, then run `source ~/.bashrc` to import those environment variables.
  - If you want to have the environment variable persist across sessions, you can update `~/.bashrc` with the same line above, or use some other mechanism for setting environment variables with a longer lifecycle.

Of course, you can also modify the python script to hardcode the path to your wallpapers folder! I like the use of environment variables because they make the code a bit neater, and allow me to publish the source without worries of privacy.

### Run
To run, execute the below command.
```python3 wallpaper-updater.py```

## Scheduling

These steps are pertinent to those who want to schedule the script execution automatically. 

I've used `crontab` for scheduling the script to run at 00:00 every day. To do this, we'll need to prepare a shell script that calls into our `python` script. Refer to [this documentation](https://help.ubuntu.com/community/CronHowto) to learn more about crontab.

1. Use `sample-update.sh` to refer to an example script. Make the relevant edits to reference the correct files.
2. Run `chmod +x sample-update.sh` to allow it to be run as an executable shell script.
3. Run `crontab -e` to open the crontab for your user profile.
4. Set up the entry with `0 0 * * * /path/to/update/script/sample-update.sh >> /logfolder/output.log 2>&1`. 
    - Replace `/path/to/update/script/sample-update.sh` to point to the shell script on your machine.
    - You can also replace the `0 0 * * *` with `@daily`. They are equivalent in definition.
    - The portion `>> /logfolder/output.log 2>&1` allows you to pipe all of the logs to some output file of your choice. This is especially useful if you do not already have an MTE set up for mailing output to you. Replace the path to point to some folder on your machine. This portion is optional.

## System
Developed with Python 3.9.5 on Ubuntu 21.04
