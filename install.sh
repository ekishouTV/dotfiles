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

dotfiles_config="$dotfiles_root/.config"
dot_config="$HOME/.config"

for app in $(find $dotfiles_config -maxdepth 1 -mindepth 1 -exec basename {} \; | grep -E -v 'tabby')
    do
        app_config_path="$dot_config/$app"
        if test -e $app_config_path && ! test -L $app_config_path; then
            mv $app_config_path "$app_config_path.orig"
        fi
        ln -s "$dotfiles_config/$app" $dot_config
done

tabby_config="$dot_config/tabby/config.yaml"
if test -f $tabby_config && ! test -L $tabby_config; then
    mv $tabby_config "$tabby_config.orig"
fi
ln -s "$dotfiles_config/tabby/config.yaml" "$dot_config/tabby"
