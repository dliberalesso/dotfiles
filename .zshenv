#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

export ZDOTDIR=${HOME}/.config/zsh

skip_global_compinit=1

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR}/.zprofile" ]]; then
    source "${ZDOTDIR}/.zprofile"
fi

# Home-made scripts
export PATH=${HOME}/.local/bin:$PATH