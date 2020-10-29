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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit lucid light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
    from"gh-r" sbin"starship" atload"eval \$(starship init zsh)" starship/starship

BASE16_THEME="dracula"
zinit wait"0a" lucid light-mode for \
    atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull"zinit creinstall -q ." \
        zsh-users/zsh-completions \
    atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down" \
        zsh-users/zsh-history-substring-search \
    chrissicool/zsh-256color \
    pick"scripts/base16-${BASE16_THEME}.sh" \
        chriskempson/base16-shell \
    pick"bash/base16-${BASE16_THEME}.config" \
        nicodebo/base16-fzf \
    pick"asdf.sh" src"completions/_asdf" \
        @asdf-vm/asdf \
    make"install PREFIX=$ZPFX" mv"completion/yadm.zsh_completion -> _yadm" \
        TheLocehiliosan/yadm

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"

zinit wait"0b" lucid from"gh-r" bpick"*amd64.deb" atclone"cp -TR usr/ $ZPFX/" atpull"%atclone" for \
    atload"alias cat=bat; export BAT_THEME=base16-256" @sharkdp/bat \
    cli/cli \
    BurntSushi/ripgrep

zinit wait"0b" lucid from"gh-r" for \
    bpick"*linux64*" mv"nvim* -> nvim" atclone"cp -TR nvim/ $ZPFX/" atpull"%atclone" neovim/neovim \
    sbin"delta*/delta" dandavison/delta \
    sbin"exa* -> exa" ogham/exa \
    sbin"tldr* -> tldr" dbrgn/tealdeer \
    sbin"win32yank.exe" equalsraf/win32yank \
    sbin junegunn/fzf-bin \
    sbin xxxserxxx/gotop \
    sbin jesseduffield/lazygit \
    sbin gokcehan/lf

zinit wait"0c" lucid for \
    OMZ::lib/termsupport.zsh \
    OMZ::plugins/git/git.plugin.zsh \
    OMZ::plugins/tmux/tmux.plugin.zsh \
    has"delta" mv"completion.zsh -> _delta" as"completion" \
        https://github.com/dandavison/delta/blob/master/etc/completion/completion.zsh \
    has"exa" mv"completions.zsh -> _exa" as"completion" \
        https://github.com/ogham/exa/blob/master/completions/completions.zsh \
    has"lf" \
        mv"lf.zsh -> _lf" as"completion" \
            https://github.com/gokcehan/lf/blob/master/etc/lf.zsh \
        https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh \
    has"tldr" mv"zsh_tealdeer -> _tldr" as"completion" \
        https://github.com/dbrgn/tealdeer/blob/master/zsh_tealdeer

zinit wait"0c" lucid light-mode has"fzf" for \
    sbin"bin/fzf-tmux" mv"shell/completion.zsh -> _fzf" \
    src"shell/key-bindings.zsh" atclone"cp -TR man/ $ZPFX/share/man/" atpull"%atclone" junegunn/fzf \
    sbin"bin/gomi" pick"/dev/null" b4b4r07/zsh-gomi \
    wfxr/forgit \
    wfxr/formarks

zinit wait"0d" lucid has"bat" has"rg" from"gh-r" \
    atclone"cp -TR bin $ZPFX/bin; cp -TR doc $ZPFX/share/doc; cp -TR man $ZPFX/share/man/man1" \
    atpull"%atclone" atload"alias man=batman" for \
        eth-p/bat-extras

export EDITOR="nvim"
export VISUAL=$EDITOR
export PAGER="less"

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
