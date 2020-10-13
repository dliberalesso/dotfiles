#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

skip_global_compinit=1

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Home-made scripts
export PATH=$PATH:${HOME}/.bin
