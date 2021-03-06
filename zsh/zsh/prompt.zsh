# prompt
setopt prompt_subst

PROMPT_HEADER=ᛊᛉᛃ
# PROMPT_HEADER=しめぷ

# mode-aware arrow
function p_arrow {
  if [[ $KEYMAP = "vicmd" ]]; then
    echo "%F{magenta}»%f"
  else
    echo "%F{cyan}»%f"
  fi
}

# colored path

function p_colored_path {
  local slash="%F{cyan}/%f"
  echo "${${PWD/#$HOME/~}//\//$slash}"
}

# git info

function p_vcs {
  vcs_info
  echo $vcs_info_msg_0_
}

# environments:
#  - ssh
#  - virtualenv
#  - cabal sandbox

export VIRTUAL_ENV_DISABLE_PROMPT=1

function p_hostname {
  [[ -n $SSH_CLIENT || -n $SHOW_HOSTNAME_IN_PROMPT ]] && echo " %F{cyan}@%f %U%m%u"
}

function p_envs {
  # check for cabal sandbox in parent directories, recursively
  local cabal
  cabal=( (../)#cabal.sandbox.config(N) )

  local envs
  (( $#cabal ))         && envs += "H"
  [[ -n $VIRTUAL_ENV ]] && envs += "P"

  [[ -n $envs ]] && echo " %F{green}[%f$envs%F{green}]%f"
}

function p_exit_code {
  echo "%(?..%B%F{red}!%f%b )"
}

PROMPT='
%F{blue}%B$PROMPT_HEADER%b%f $(p_colored_path)$(p_hostname)$(p_envs)$(p_vcs)
$(p_exit_code)$(p_arrow) '

function p_continuation {
  echo "%1(_.%_.contd)"
}

PS2='$(p_continuation) $(p_arrow) '
