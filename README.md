# Wallpaper Captain!
I want to use wallpapers that mean something to me. At first iteration, I'll set the wallpaper to a random picture from a folder in which I keep photos from various occasions in my life. Each random photo allows me to think back to a different time, state, or place I was in, and to be serendipitously reminded of its beauty.

## Setup

### Photos
Assemble a photo album on your machine, comprised of photos you'd like to use as the source for your wallpapers.

### Environment
Assuming you have Python installed already, you can follow the below procedures.

Before running the script, you must set the relevant environment variable which indicates to the script where the folder of the wallpapers you created in the step prior lives. 

- If you want to set the environment variable for the lifetime of the terminal, you can use this command inside the terminal you will use to run the script: `export WALLPAPER_CAPTAIN_FOLDER=/path/to/wallpapers/folder/`

- If you want to have the environment variable persiste across sessions, you can update `~/.bashrc` with the same line above. This will come in use if you plan to regularly use the script, a scenario I'll describe below.

## Run
To run, simply execute the below command:
`python3 wallpaper-updater.py`

## System
Run with Python 3.9.5 on Ubuntu 21.04
