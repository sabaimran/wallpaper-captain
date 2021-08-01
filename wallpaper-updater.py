import os
from random import randrange
from os.path import join

# This indicates where the images used for the wallpaper are stored.
wallpaper_folder_path = os.environ['WALLPAPER_CAPTAIN_FOLDER']

def set_wallpaper(filepath: str):
    """
    Given a filepath to an image, sets the wallpaper to that image.
    """
    os.system(f"gsettings set org.gnome.desktop.background picture-uri file:{filepath}")

def get_wallpaper_options():
    """
    Return the list of filepaths to wallpaper options.
    """
    return [join(wallpaper_folder_path, f) for f in os.listdir(wallpaper_folder_path)]

if __name__ == "__main__":
    wallpaper_options = get_wallpaper_options()

    # Pick a random index in the range of the number of wallpaper options, and set the background.
    set_wallpaper(wallpaper_options[randrange(len(wallpaper_options))])
