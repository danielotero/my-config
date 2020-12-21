HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
# Prevents the current line from being saved in the history if it is the same as the previous one
setopt histignoredups
# Appends history list to the history file, rather than replacing it ("inc" for inmediate append instead at exit)
#setopt appendhistory
setopt incappendhistory
# Prevents the current line from being saved if it begins with a space
setopt histignorespace
# Reloads the history whenever you use it
setopt sharehistory
