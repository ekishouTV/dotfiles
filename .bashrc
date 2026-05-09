source ~/.bashrc.orig

# ~/.profile is not read
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Enable mise
eval "$(~/.local/bin/mise activate bash)"

# Enable Starship
eval "$(starship init bash)"

# Completion
bind '"\C-i": menu-complete'

# Disable screen lock
stty stop undef

# Post start
fastfetch
