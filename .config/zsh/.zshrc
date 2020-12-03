# vim:syntax=zsh
# vim:filetype=zsh

# Load Zinit module (build it with 'zinit module build')
module_path+=( "/home/dli5/.config/zsh/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin

# Load our prompt
# TODO: update this file with 'starship init zsh' after updates
source "$HOME/.cache/zsh/starship-init"

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$ZDOTDIR/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

# History command configuration
setopt always_to_end          # cursor moved to the end in full completion
setopt automenu
setopt completealiases        # complete alisases
setopt complete_in_word       # allow completion from within a word/phrase
setopt extended_history       # record timestamp of command in HISTFILE
setopt hash_list_all          # hash everything before completion
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt interactivecomments    # Recognize comments
setopt listpacked
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nocorrect              # spelling correction for commands
setopt nolisttypes
setopt share_history          # share command history data

# Load Zinit
source "$ZDOTDIR/.zinit/bin/zinit.zsh"
unalias zi

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit lucid light-mode for \
    zinit-zsh/z-a-readurl \
    zinit-zsh/z-a-bin-gem-node

BASE16_THEME="dracula"
zinit wait"0a" lucid light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull"zinit creinstall -q ." \
        zsh-users/zsh-completions \
    chrissicool/zsh-256color \
    pick"scripts/base16-$BASE16_THEME.sh" \
        chriskempson/base16-shell \
    pick"bash/base16-$BASE16_THEME.config" \
        nicodebo/base16-fzf \
    mv"shell/completion.zsh -> _fzf" pick"shell/key-bindings.zsh" \
        junegunn/fzf \
    wfxr/forgit

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"

[ -d "$ZPFX/share/doc" ] || mkdir -p "$ZPFX/share/doc"
[ -d "$ZPFX/share/man/man1" ] || mkdir -p "$ZPFX/share/man/man1"

zinit wait"0b" lucid from"gh-r" for \
    atclone"cp -TR bin $ZPFX/bin; cp -TR doc $ZPFX/share/doc; cp -TR man $ZPFX/share/man/man1" \
    atpull"%atclone" atload"alias man=batman" \
        eth-p/bat-extras

# load direnv and zoxide
# TODO: update this file with 'direnv hook zsh' after updates
source "$HOME/.cache/zsh/direnv-hook"
# TODO: update this file with 'zoxide init zsh' after updates
source "$HOME/.cache/zsh/zoxide-init"

# load keybindings
source "$ZDOTDIR/keybindings.zsh"

export EDITOR="nvim"
export VISUAL=$EDITOR
export PAGER="less"
export BAT_THEME=base16-256

autoload colors && colors

# load aliases
source "$ZDOTDIR/aliases.zsh"

# load LF Icons
source "$ZDOTDIR/lf_icons.zsh"
