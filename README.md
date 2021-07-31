# Wallpaper Captain!
I want to use wallpapers that mean something to me. At first iteration, I'll set the wallpaper to a random picture from a folder in which I keep photos from various occasions in my life. Each random photo allows me to think back to a different time, state, or place I was in, and to be serendipitously reminded of its beauty.

## Checkout

Checkout using `git checkout https://github.com/sabaimran/wallpaper-captain.git`.

## Prerequisites

### Photos
Assemble a photo album on your machine, comprised of photos you'd like to use as the source for your wallpapers.

## Manual Execution

These steps are pertinent for users who want to trigger the script manually, or run it within the normal terminal environment.

### Environment
Assuming you have Python installed already, you can follow the below procedures. Note that these instructions pertain to triggers from the normal terminal environment. For scheduling instructions, you can look below.

Before running the script, you must set the relevant environment variable which indicates to the script where the folder of the wallpapers you created in the step prior lives. Below are two methods highlighted to accomplishing this, if you're new to environment variables:

- `export WALLPAPER_CAPTAIN_FOLDER=/path/to/wallpapers/folder/`
  - If you want to set the environment variable for the lifetime of the terminal, you can use this command inside the terminal you will use to run the script.

- Add `export WALLPAPER_CAPTAIN_FOLDER=/path/to/wallpapers/folder/` to `~/.bashrc`, then run `source ~/.bashrc` to import those environment variables.
  - If you want to have the environment variable persist across sessions, you can update `~/.bashrc` with the same line above, or use some other mechanism for setting environment variables with a longer lifecycle.

### Run
To run, execute the below command.
`python3 wallpaper-updater.py`

## Scheduling

These steps are pertinent to those who want to schedule the script execution automatically. 

I've used `crontab` for scheduling the script to run at 00:00 every day. To do this, we'll need to prepare a shell script that calls into our `python` script. Refer to [this documentation](https://help.ubuntu.com/community/CronHowto) to learn more about crontab.

1. Use `sample-update.sh` to refer to an example script. Make the relevant edits to reference the correct files.
2. Type in `crontab -e` to open the crontab for your user profile.
3. Set up the entry with `0 0 * * * /path/to/update/script/sample-update.sh >> /logfolder/output.log 2>&1`
  - You can also replace the `0 0 * * *` with `@daily`. They are equivalent in definition.
  - The portion `/logfolder/output.log 2>&1` allows you to pipe all of the logs to some output file of your choice. This is especially useful if you do not already have an MTE set up for mailing output to you.

## System
Developed with Python 3.9.5 on Ubuntu 21.04
