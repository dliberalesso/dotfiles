# vim:syntax=zsh
# vim:filetype=zsh

export XDG_CONFIG_HOME=${HOME}/.config
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

skip_global_compinit=1

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR}/.zprofile" ]]; then
    source "${ZDOTDIR}/.zprofile"
fi

# Home-made scripts
export PATH=${HOME}/.local/bin:$PATH
