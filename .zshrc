zmodload zsh/zprof

# if [[ ! -d ~/.zplug ]]; then
#     ( git clone https://github.com/zplug/zplug ~/.zplug )
# fi

source ~/.zplug/init.zsh

# zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "woefe/wbase.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zdharma/fast-syntax-highlighting"

zplug "chriskempson/base16-shell", use:scripts/base16-dracula.sh, defer:0
zplug "starship/starship", from:gh-r, as:command, rename-to:starship

zplug "plugins/asdf", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh

zplug "sharkdp/bat", from:gh-r, use:"*x86_64*linux-gnu*", as:command
zplug "ogham/exa", from:gh-r, use:"*linux-x86_64*", as:command
zplug "wfxr/forgit", on:"junegunn/fzf-bin"
zplug "junegunn/fzf-bin", from:gh-r, use:"*linux*amd64*", as:command, rename-to:fzf
zplug "junegunn/fzf", use:bin/fzf-tmux, as:command
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "junegunn/fzf", use:shell/completion.zsh
zplug "b4b4r07/zsh-gomi", on:"junegunn/fzf-bin"
zplug "xxxserxxx/gotop", from:gh-r, use:"*linux_amd64.tgz", as:command
zplug "BurntSushi/ripgrep", from:gh-r, use:"*x86_64*linux*", as:command, rename-to:"rg"
zplug "dbrgn/tealdeer", from:gh-r, use:"*x86_64*", as:command, rename-to:tldr
zplug "TheLocehiliosan/yadm", as:command

# if ! zplug check --verbose; then
#     printf "Install? [y/n]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

zplug load

eval "$(starship init zsh)"

# alias la="ls -lah --color=auto"
# alias lh="ls -lh --color=auto"
# alias ls="ls --color=auto"
# alias grep="grep --color=auto"

