#!/bin/bash

dotfiles_root=$(realpath $(dirname $0))

# Files of directly under home directory
for dotfile in $(ls $dotfiles_root -ap | grep -v '/' | grep '^\.' | grep -v '.gitattributes')
    do
        dotfile_path="$HOME/$dotfile"
        if test -f $dotfile_path && ! test -L $dotfile_path; then
            mv $dotfile_path "$dotfile_path.orig"
        fi
        ln -s "$dotfiles_root/$dotfile" $HOME
done
