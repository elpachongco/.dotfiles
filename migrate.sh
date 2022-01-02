#! /bin/bash

# Description
# migrate.sh scans the files within the directory it is located in and creates a symlink of the files directly outside the directory. 
# The original files will remain untouched.

# Commentary 
# Store .dotfiles to home i.e. ~/.dotfiles. Run $ bash ~/.dotfiles/migrate.sh. 
# Symlinks by default will be on ~/.dotfiles/.. 
# For example, when migrate.sh is run, a file ~/.dofiles/.bashrc will have a symlink on ~/.bashrc. 
# migrate.sh only handles single files, not directories.  

# To use, go to home directoy:
#$ cd ~/
# Then run
#$ bash .dotfiles/migrate.sh

ln -sf ~/.dotfiles/.bashrc .
ln -sf ~/.dotfiles/.bash_aliases .
ln -sf ~/.dotfiles/.config/i3 .config/.
ln -sf ~/.dotfiles/.config/nvim .config/.
ln -sf ~/.dotfiles/.emacs.d .
ln -sf ~/.dotfiles/.tmux.conf .
ln -sf ~/.dotfiles/.xmodmaprc .
ln -sf ~/.dotfiles/.Xresources .
