# vim:syntax=zsh
# vim:filetype=zsh

# eliminates duplicates in *paths
typeset -gU cdpath fpath path

# Zsh search path for executable
path=(
    /usr/local/{bin,sbin}
    $path
)

# autostart X
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep bspwm || startx "$XDG_CONFIG_HOME/x11/xinitrc"
fi
