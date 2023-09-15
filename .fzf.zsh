# Setup fzf
# ---------
if [[ ! "$PATH" == */home/gustavo/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/gustavo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/gustavo/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/gustavo/.fzf/shell/key-bindings.zsh"
