################################################################################
# Exported Variables
################################################################################

# First items are added first, but referred to last - first in, last out.
export PATH=/usr/local/bin:$PATH # Recommended by brew doctor
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export PATH="$HOME/.bun/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH=/opt/homebrew/sbin:$PATH # Recommended by brew doctor
export PATH=/opt/homebrew/bin:$PATH  # Brew is first as everything else uses that
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional

export NODE_ENV=development
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="nvim"
#export TERMINAL=ghostty
