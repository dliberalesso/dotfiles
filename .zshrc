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

# Create needed dir
mkdir -p $ZPFX/share/man/man1

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
zinit wait lucid light-mode for \
    chrissicool/zsh-256color \
    pick"scripts/base16-${BASE16_THEME}.sh" \
        chriskempson/base16-shell \
    pick"bash/base16-${BASE16_THEME}.config" \
        nicodebo/base16-fzf

# Starship prompt
zinit ice lucid from"gh-r" sbin"starship" atload"eval \$(starship init zsh)"
zinit light starship/starship

# Basic shell
zinit wait lucid light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull"zinit creinstall -q ." \
        zsh-users/zsh-completions

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

zinit ice wait lucid \
    atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down"
zinit light zsh-users/zsh-history-substring-search

# OMZ stuff
zinit wait lucid for \
    OMZ::lib/termsupport.zsh \
    OMZ::plugins/git/git.plugin.zsh \
    OMZ::plugins/tmux/tmux.plugin.zsh

# asdf
zinit ice wait lucid pick"asdf.sh" src"completions/_asdf"
zinit light asdf-vm/asdf

# bat
zinit ice wait lucid from"gh-r" mv"bat* -> bat" \
    atclone"cp bat/bat $ZPFX/bin/bat; cp bat/bat.1 $ZPFX/share/man/man1/bat.1" \
    atpull"%atclone" atload"alias cat=bat; export BAT_THEME=base16-256"
zinit light sharkdp/bat

# delta
zinit ice wait lucid from"gh-r" sbin"delta*/delta"
zinit light dandavison/delta
zinit ice wait lucid has"delta" mv"completion.zsh -> _delta" as"completion"
zinit snippet https://github.com/dandavison/delta/blob/master/etc/completion/completion.zsh

# exa
zinit ice wait lucid from"gh-r" sbin"exa* -> exa"
zinit light ogham/exa
zinit ice wait lucid has"exa" mv"completions.zsh -> _exa" as"completion"
zinit snippet https://github.com/ogham/exa/blob/master/completions/completions.zsh

# fzf
zinit ice wait lucid from"gh-r" sbin"fzf"
zinit light junegunn/fzf-bin
zinit ice wait lucid has"fzf" sbin"bin/fzf-tmux" mv"shell/completion.zsh -> _fzf" \
    src"shell/key-bindings.zsh" atclone"cp man/man1/* $ZPFX/share/man/man1/" atpull"%atclone"
zinit light junegunn/fzf

# forgit
zinit ice wait lucid has"fzf"
zinit light wfxr/forgit

# formarks
zinit ice wait lucid has"fzf"
zinit light wfxr/formarks

# gomi
zinit ice wait lucid has"fzf" sbin"bin/gomi" pick"/dev/null"
zinit light b4b4r07/zsh-gomi

# ripgrep
zinit ice wait lucid from"gh-r" mv"ripgrep* -> ripgrep" atpull"%atclone" \
    atclone"cp ripgrep/rg $ZPFX/bin/rg; cp ripgrep/doc/rg.1 $ZPFX/share/man/man1/rg.1"
zinit light BurntSushi/ripgrep

# tealdeer
zinit ice wait lucid from"gh-r" sbin"tldr* -> tldr"
zinit light dbrgn/tealdeer
zinit ice wait lucid has"tldr" mv"zsh_tealdeer -> _tldr" as"completion"
zinit snippet https://github.com/dbrgn/tealdeer/blob/master/zsh_tealdeer

# yadm
zinit ice wait lucid make"install PREFIX=$ZPFX" mv"completion/yadm.zsh_completion -> _yadm"
zinit light TheLocehiliosan/yadm

# Alias
alias la="exa -a --color=auto"
alias lh="exa -lh --color=auto"
alias lah="exa -lah --color=auto"
alias ls="exa --color=auto"
alias grep="grep --color=auto"
