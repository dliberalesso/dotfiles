if [[ ! -d ~/.zplug ]]; then
    ( git clone https://github.com/zplug/zplug ~/.zplug )
fi

source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage", defer:0
zplug "woefe/wbase.zsh"

zplug "lib/completion", from:oh-my-zsh, defer:0
zplug "lib/directories", from:oh-my-zsh, defer:0
zplug "lib/grep", from:oh-my-zsh, defer:0
zplug "lib/key-bindings", from:oh-my-zsh, defer:0
zplug "lib/history", from:oh-my-zsh, defer:0
zplug "lib/misc", from:oh-my-zsh, defer:0
zplug "lib/termsupport", from:oh-my-zsh, defer:0

zplug "chriskempson/base16-shell", use:scripts/base16-dracula.sh, defer:0

zplug "plugins/asdf", from:oh-my-zsh, defer:1
zplug "plugins/git", from:oh-my-zsh, defer:1
zplug "plugins/tmux", from:oh-my-zsh, defer:1

zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2

# ag
zplug "sharkdp/bat", from:gh-r, use:"*x86_64*linux-gnu*", as:command, defer:3
zplug "ogham/exa", from:gh-r, use:"*linux-x86_64*", as:command, defer:3
zplug "junegunn/fzf-bin", from:gh-r, use:"*linux*amd64*", as:command, rename-to:fzf, defer:3
zplug "junegunn/fzf", use:bin/fzf-tmux, as:command, defer:3
zplug "junegunn/fzf", use:shell/key-bindings.zsh, defer:3
zplug "junegunn/fzf", use:shell/completion.zsh, defer:3
zplug "b4b4r07/zsh-gomi", on:"junegunn/fzf-bin", defer:3
zplug "xxxserxxx/gotop", from:gh-r, use:"*linux_amd64.tgz", as:command, defer:3
zplug "jesseduffield/lazygit", from:gh-r, use:"*Linux*x86_64*", as:command, rename-to:lazygit, defer:3
# zplug "jarun/nnn", from:gh-r, use:"*tar.gz" as:command
zplug "starship/starship", from:gh-r, as:command, rename-to:starship, defer:3
zplug "BurntSushi/ripgrep", from:gh-r, use:"*x86_64*linux*", as:command, rename-to:"rg", defer:3
# zplug "dbrgn/tealdeer", from:gh-r, use:"*linux-x86_64-musl", as:command, rename-to:tldr, defer:3
zplug "akavel/up", from:gh-r, use:"*up", as:command, defer:3
# zplug "TheLocehiliosan/yadm", use:"completion/yadm.zsh_completion", as:command, rename-to:yadm, defer:3
zplug "TheLocehiliosan/yadm", as:command, rename-to:yadm, defer:3
zplug "rupa/z", use:z.sh, defer:3

if ! zplug check --verbose; then
    printf "Install? [y/n]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
eval "$(starship init zsh)"

# alias la="ls -lah --color=auto"
# alias lh="ls -lh --color=auto"
# alias ls="ls --color=auto"
# alias grep="grep --color=auto"

