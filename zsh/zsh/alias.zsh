# There are some ways to alter invocations of programs:
#
# * nocorrect: don't suggest a correction
# * noglob: don't interpret glob patterns

alias reload='killall -USR1 zsh'

alias ls='ls -lh --color=always'

alias less='less -FXr'
alias -g eless='2>&1 | less'

alias tsup='sudo ntpd -qg'

alias sedit='sudoedit'

# using `type` is much nicer and provides information for various layers
alias which='type -a'

# prompt if deleting more than 3 files
alias rm='rm -I'

if command_exists git; then
  alias git='noglob git'
  alias g='git'
fi

if command_exists vim; then
  # update packages
  alias vimup='vim +PlugInstall +qall'
fi

if command_exists tree; then
  alias tree='tree -I .git -a'
fi

if command_exists xsel; then
  alias cbc='xsel -i -b'
  alias cbp='xsel -o -b'
elif command_exists pbcopy; then
  alias cbc='pbcopy'
  alias cbp='pbpaste'
fi

if command_exists gist; then
  alias gist='gist -c -o'
fi

if command_exists systemctl; then
  alias sc='systemctl'
  alias scs='systemctl status'
  alias scr='systemctl restart'

  alias ssc='sudo systemctl'
  alias sscr='sudo systemctl restart'

  alias scu='systemctl --user'
  alias scus='systemctl --user status'
  alias scur='systemctl --user restart'

  alias jc='journalctl'
  alias jcu='journalctl --user-unit'
fi

if command_exists pacman; then
  alias p='pacman'

  alias pacup='sudo pacman -Syu'
  alias pacin='sudo pacman -S'
  alias packg='sudo pacman -U'
  alias pacun='sudo pacman -Rs'

  # search remote/local for package
  alias pacss='pacman -Ss'
  alias pacqs='pacman -Qs'

  # information about a package
  alias pacqi='pacman -Qi'
  alias pacsi='pacman -Si'

  # list files owned by package
  alias pacql='pacman -Ql'

  # who owns this file
  alias pacqo='pacman -Qo'

  # all foreign packages
  alias pacqm='pacman -Qm'
fi

if command_exists yaourt; then

  alias yaoin='yaourt -S'
  alias yaokg='yaourt -U'
  alias yaoun='yaourt -Rs'

  # search remote/local for package
  alias yaoss='yaourt -Ss'
  alias yaoqs='yaourt -Qs'

  # information about a package
  alias yaoqi='yaourt -Qi'
  alias yaosi='yaourt -Si'

  # list files owned by package
  alias yaoql='yaourt -Ql'

  # who owns this file
  alias yaoqo='yaourt -Qo'

  # all foreign packages
  alias yaoqm='yaourt -Qm'
fi
