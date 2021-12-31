# migrate.sh scans the files within the directory it is located in and creates a symlink of the files directly outside the directory. 
# The original files will remain untouched.

# Commentary 
# Store .dotfiles to ~/.dotfiles. Run $ bash ~/.dotfiles/migrate.sh. Symlinks by default will be on ~/.dotfiles/.. 
# For example, when migrate.sh is run, a file ~/.dofiles/.bashrc will have a symlink on ~/.bashrc. 
# migrate.sh only handles single files, not directories.  

