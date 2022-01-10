# Command prompt
export PS1="[\D{%T}] \W > "

# export LC_ALL="en_US"
# export LANG="en_US.UTF-8"

# Colored ls output
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ll="ls -alFh"

# Default editor
export EDITOR="vim"
export VISUAL="code"
# Open with `e` alias any folder or current dir by default in editor
e() {
  if [ -z "$1" ]; then
    $VISUAL .
  else
    $VISUAL "$1"
  fi
}
# Bundle open
export BUNDLER_EDITOR=$VISUAL

# RubyMine
rubymine() {
  $(nohup ~/Applications/RubyMine-2021.2.3/bin/rubymine.sh .  > /dev/null 2>&1 &)
}

# GoLand
goland() {
  $(nohup ~/Applications/GoLand-2021.2.4/bin/goland.sh .  > /dev/null 2>&1 &)
}

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export RUBY_CONFIGURE_OPTS="--disable-install-doc"

# Binstubs
export PATH="./bin:$PATH"

# Python
export PATH="$HOME/.local/bin:$PATH"

# Bundle
alias b="bundle"
alias be="bundle exec"
alias bo="bundle open"
alias bl="BUNDLE_GEMFILE=Gemfile.local b"
alias ble="bl exec"
alias blo="bl open"

# Shortcuts
alias cdp="cd $HOME/Projects/Projects"
alias cdr="cd $HOME/Projects/Ruby"

# Alias open on linux
type open > /dev/null 2>&1 || alias open="xdg-open"

# Homebrew
if type brew > /dev/null 2>&1 && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash

  # Ruby + Homebrew
  export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"
fi

# Git
alias g="git"
[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
__git_complete g __git_main

# Applications
export PATH="$HOME/Applications/bin:$PATH"

# RabbitMQ
export PATH="$PATH:/usr/local/sbin"

# Scala - gotta use sbt
# export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
# Headless Chrome/Chromium
if [[ -f "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]]; then
  export BROWSER_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
else
  export PATH="$PATH:/opt/google/chrome"
  export BROWSER_PATH="/opt/google/chrome/chrome"
fi

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Projects/Go
export PATH=$PATH:$(go env GOPATH)/bin

# R
export R_LIBS_USER="$HOME/Projects/R/x86_64-pc-linux-gnu-library/3.6"

# Terraform
# export PATH="$PATH:/opt/terraform"

# Postgres
# export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

# Yandex Cloud
# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/route/.yandex-cloud/path.bash.inc' ]; then source '/home/route/.yandex-cloud/path.bash.inc'; fi
# The next line enables shell command completion for yc.
if [ -f '/home/route/.yandex-cloud/completion.bash.inc' ]; then source '/home/route/.yandex-cloud/completion.bash.inc'; fi

# Node
export PATH="./node_modules/.bin:$PATH"
# Npm global packages w/o sudo https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Rust
source "$HOME/.cargo/env"

# Minikube switch to kube's registry
minikube_registry() {
  eval $(minikube -p minikube docker-env)
}

alias dc="docker-compose"
