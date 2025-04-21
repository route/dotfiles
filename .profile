# Command prompt
export PS1="[\D{%T}] \W > "

# export LC_ALL="en_US"
# export LANG="en_US.UTF-8"

export BASH_SILENCE_DEPRECATION_WARNING=1

# Colored ls output
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ll="ls -alFh"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export RUBY_CONFIGURE_OPTS="--disable-install-doc"

# Binstubs
export PATH="./bin:$PATH"

# Python
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Python/3.12/bin:$PATH"
export PATH=$(brew --prefix python)/libexec/bin:$PATH

# Bundle
alias b="bundle"
alias be="bundle exec"
alias bo="bundle open"
alias bl="BUNDLE_GEMFILE=tmp/Gemfile b"
alias ble="bl exec"
alias blo="bl open"

# Shortcuts
alias cdp="cd /Volumes/Projects/Projects"

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
export GOPATH=$HOME/.go
export PATH=$PATH:$(go env GOPATH)/bin

# Postgres
export PATH="$(brew --prefix postgresql@13)/bin:$PATH"
export GEOS_LIBRARY_PATH="$(brew --prefix geos)/lib/libgeos_c.1.dylib"

# Node
export PATH="./node_modules/.bin:$PATH"
# Npm global packages w/o sudo https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Rust
. "$HOME/.cargo/env"

# Terraform
# export PATH="$PATH:/opt/terraform"

# Yandex Cloud
# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/route/.yandex-cloud/path.bash.inc' ]; then source '/home/route/.yandex-cloud/path.bash.inc'; fi
# The next line enables shell command completion for yc.
if [ -f '/home/route/.yandex-cloud/completion.bash.inc' ]; then source '/home/route/.yandex-cloud/completion.bash.inc'; fi

# Docker
alias d='docker'
alias dl='docker ps'
alias sdl='docker ps --format "table {{.Image}}\t{{.Status}}\t{{.Names}}"'
alias pdl='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dla='docker ps -a'
alias dr='docker run'
alias de='docker exec'
alias di='docker images'
alias dv='docker volume'
alias dlv='docker volume ls'
alias dn='docker network'
alias dln='docker network ls'
alias din='docker network inspect'
alias dlo='docker logs'
alias dlf='docker logs -f --tail 50'

# Docker Compose
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcdv='docker compose down --volume'

# Kubernetes
alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kga='kubectl get pods --all-namespaces'
alias kgs='kubectl get service'
alias kgn='kubectl get nodes'
alias kgd='kubectl get deployments'
alias kgss='kubectl get secrets'

alias kd='kubectl describe'
alias kdp='kubectl describe pods'
alias kds='kubectl describe service'
alias kdn='kubectl describe nodes'
alias kdd='kubectl describe deployments'
alias kdss='kubectl describe secrets'

alias kgc='kubectl config get-contexts'
alias ksc='kubectl config set-context'
alias kuc='kubectl config use-context'
alias kdc='kubectl config delete-context'

alias kaf='kubectl apply -f'
alias kep='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[0].metadata.name}") -- bash'
alias kep2='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[1].metadata.name}") -- bash'
alias kep3='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[2].metadata.name}") -- bash'
alias kep4='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[3].metadata.name}") -- bash'
alias kep5='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[4].metadata.name}") -- bash'
alias kep6='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[5].metadata.name}") -- bash'
alias kep7='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[6].metadata.name}") -- bash'
alias kep8='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[7].metadata.name}") -- bash'
alias kep9='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[8].metadata.name}") -- bash'
alias kep10='kubectl exec -it $(kubectl get pod -o jsonpath="{.items[9].metadata.name}") -- bash'
alias klc='kubectl logs -f --tail 100 $(kubectl get pod -o jsonpath="{.items[0].metadata.name}") -- '

# Kubens
alias kb='kubens'

# Kubectx
alias kx='kubectx'
