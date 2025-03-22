source ~/.bashrc.orig

# Load ble.sh settings
[[ $- == *i* ]] &&
  source "$HOME/.local/share/blesh/ble.sh" --noattach

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

# Enable ble.sh
[[ ! ${BLE_VERSION-} ]] || ble-attach
