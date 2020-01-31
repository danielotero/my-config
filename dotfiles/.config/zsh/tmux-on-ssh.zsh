if [[ -z "$TMUX" && -n "$SSH_CONNECTION" ]] && type tmux >& /dev/null; then
  # Override the TERM variable if there is no terminfo available
  if ! infocmp $TERM >& /dev/null;
  then
    TERM=xterm-256color
  fi

  exec tmux new -A -s ssh
fi

