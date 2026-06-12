# Set sheldon install path
export PATH=$HOME/.local/bin:$PATH

eval "$(devbox global shellenv)"
eval "$(direnv hook zsh)"
eval "$(sheldon source)"
