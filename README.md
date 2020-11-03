# dotfiles
My (ArchWSL2)[https://github.com/yuk7/ArchWSL] dotfiles

```sh
pacman -Syu base-devel git man reflector unzip wget zsh

rm -rf .bash*

git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
cd ..
rm -rf paru/
paru --gendb

paru -S asp bandwhich bat bottom-bin dust-bin exa fd fzf github-cli git-delta-bin grex hyperfine lf-bin \
  procs-bin ripgrep sd starship-bin neovim-nightly tealdeer tmux tokei yadm zoxide-bin

yadm clone --bootstrap https://github.com/dliberalesso/dotfiles

asdf erlang elixir nodejs python ruby rust

pip install --upgrade pynvim
npm install -g neovim yarn
```

# TODO:
- [ ] Create completions and tldr for [imsnif/bandwhich](https://github.com/imsnif/bandwhich) and update its [PKGBUILD](https://www.archlinux.org/packages/community/x86_64/bandwhich/)
- [ ] Fix zsh completions install in [junegunn/fzf](https://github.com/junegunn/fzf)'s [PKGBUILD](https://www.archlinux.org/packages/community/x86_64/fzf/)
- [ ] Create completions for [chmln/sd](https://github.com/chmln/sd) and update its [PKGBUILD](https://www.archlinux.org/packages/community/x86_64/sd/)
- [ ] Create completions and man for [XAMPPRocky/tokei](https://github.com/XAMPPRocky/tokei) and update its [PKGBUILD](https://www.archlinux.org/packages/community/x86_64/tokei/)
- [ ] Create completions and man for [ClementTsang/bottom](https://github.com/ClementTsang/bottom)
- [ ] Create completions, man and tldr for [bootandy/dust](https://github.com/bootandy/dust) and update its [PKGBUILD](https://aur.archlinux.org/packages/dust-bin/)
- [ ] Create completions and man for [dandavison/delta](https://github.com/dandavison/delta) and update its [PKGBUILD](https://aur.archlinux.org/packages/git-delta-bin/)
- [ ] Create completions and man for [pemistahl/grex](https://github.com/pemistahl/grex) and update its [PKGBUILD](https://aur.archlinux.org/packages/grex/)
- [ ] Create completions, man and tldr for [dalance/procs](https://github.com/dalance/procs) and update its [PKGBUILD](https://aur.archlinux.org/packages/procs-bin/)
