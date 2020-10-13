#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Recognize comments
setopt interactivecomments

# Install zinit if not present
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

# Colors
# atclone"dircolors -b LS_COLORS > c.zsh" atpull"%atclone" pick"c.zsh" \
# trapd00r/LS_COLORS \
export BASE16_THEME="dracula"
zinit lucid light-mode for \
    chrissicool/zsh-256color \
    pick"scripts/base16-${BASE16_THEME}.sh" \
        chriskempson/base16-shell \
    wait src"bash/base16-${BASE16_THEME}.config" pick"bash/base16-${BASE16_THEME}.config" \
        nicodebo/base16-fzf

# Starship prompt
zinit ice lucid from"gh-r" as"command" pick"starship" atload"eval \$(starship init zsh)"
zinit light starship/starship

# Basic shell
zinit lucid light-mode for \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull"zinit creinstall -q ." \
        zsh-users/zsh-completions \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

# History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

zinit ice wait lucid nocompile \
    atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down"
zinit light zsh-users/zsh-history-substring-search

# OMZ stuff
zinit wait lucid for \
    OMZ::lib/termsupport.zsh \
    OMZ::plugins/git/git.plugin.zsh \
    OMZ::plugins/tmux/tmux.plugin.zsh

# asdf stuff
zinit ice wait lucid pick"asdf.sh" src"completions/_asdf"
zinit light asdf-vm/asdf

# yadm
zinit ice wait lucid pick"yadm" as"command"
zinit light TheLocehiliosan/yadm

# Alias
alias la="ls -lah --color=auto"
alias lh="ls -lh --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
