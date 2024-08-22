# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

# Add npm related PATH
NPM_PACKAGES="$HOME/.npm-packages"

if [ -d "$NPM_PACKAGES" ]; then
  export PATH="$PATH:$NPM_PACKAGES/bin"
  export MANPATH="$MANPATH:$NPM_PACKAGES/share/man"
fi

# Add Go related PATH
export GOPATH="$HOME/go"

if [ -d "$GOPATH" ]; then
  export PATH="$PATH:$GOPATH/bin"
fi

if [ -d "/usr/local/go/bin" ]; then
  export PATH="$PATH:/usr/local/go/bin"
fi

# Add Rust related PATH
if [ -d "$HOME/.cargo/env" ]; then
  export PATH="$PATH:$HOME/.cargo/env"
fi

function is_linux() {
  uname | grep -iq linux
}

function is_wsl() {
  uname -a | grep -iq microsoft
}

# Persist ssh session across shells in WSL
if is_wsl && keychain --quiet; then
  eval "$(keychain --quiet --eval id_rsa)"
fi

# Add default less options
# -F to quit automatically if the file is shorter than the screen
# -X to not clear the screen after quitting
# -R to show only color escape sequences in raw form
# -M to show a more verbose prompt
export LESS="FXRM"

alias r='ranger'

if is_linux; then
  alias ls='ls -A --color=auto --group-directories-first --time-style=long-iso --human-readable -v'
  alias ll='ls -l'
fi

if is_linux; then
  if is_wsl; then
    alias open='wslview'
  else
    alias open='xdg-open'
  fi
fi

alias cat='bat'

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi