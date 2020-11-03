#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$ZDOTDIR/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

# History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect              # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt interactivecomments    # Recognize comments
setopt nolisttypes
setopt listpacked
setopt automenu

# zinit
source "$ZDOTDIR/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
unalias zi

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit lucid light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node
    
eval "$(starship init zsh)"

BASE16_THEME="dracula"
zinit wait"0a" lucid light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull"zinit creinstall -q ." \
        zsh-users/zsh-completions \
    chrissicool/zsh-256color \
    pick"scripts/base16-${BASE16_THEME}.sh" \
        chriskempson/base16-shell \
    pick"bash/base16-${BASE16_THEME}.config" \
        nicodebo/base16-fzf \
    mv"shell/completion.zsh -> _fzf" pick"shell/key-bindings.zsh" \
        junegunn/fzf \
    sbin"bin/gomi" pick"/dev/null" \
        b4b4r07/zsh-gomi \
    wfxr/forgit \
    wfxr/formarks

[ -d "$ZPFX/share/doc" ] || mkdir -p "$ZPFX/share/doc"
[ -d "$ZPFX/share/man/man1" ] || mkdir -p "$ZPFX/share/man/man1"

zinit wait"0b" lucid from"gh-r" for \
    atclone"cp -TR bin $ZPFX/bin; cp -TR doc $ZPFX/share/doc; cp -TR man $ZPFX/share/man/man1" \
    atpull"%atclone" atload"alias man=batman" \
        eth-p/bat-extras \
    sbin"win32yank.exe" \
        equalsraf/win32yank

eval "$(zoxide init zsh)"

export EDITOR="nvim"
export VISUAL=$EDITOR
export PAGER="bat"
export BAT_THEME=base16-256

autoload colors && colors

# Alias
alias la="exa -a --color=auto"
alias lh="exa -lh --color=auto"
alias lah="exa -lah --color=auto"
alias ls="exa --color=auto"
alias grep="grep --color=auto"
alias dotfiles="cd ~/ && GIT_DIR=/home/dli5/.config/yadm/repo.git nvim"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}" --preview-window=right:60%:wrap'
export FZF_ALT_C_OPTS='--preview="ls {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'--height=50%'

export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.ex=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
