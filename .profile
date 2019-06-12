export LC_ALL="en_US"
export LANG="en_US.UTF-8"

# Command prompt
export PS1="[\D{%T}] \W > "

# Colored ls output
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ll="ls -alFh"

# Default editor
export EDITOR="vim"
export VISUAL="atom"
# Open with `e` alias any folder or current dir by default in editor
e() {
  if [ -z "$1" ]; then
    $VISUAL .
  else
    $VISUAL "$1"
  fi
}
# Bundle open
export BUNDLER_EDITOR="atom"

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export RUBY_CONFIGURE_OPTS="--disable-install-doc"

# Binstubs
export PATH="./bin:$PATH"

# Node
export PATH="./node_modules/.bin:$PATH"

# Bundle
alias b="bundle"
alias be="bundle exec"
alias bo="bundle open"
alias bl="BUNDLE_GEMFILE=Gemfile.local bundle"
alias ble="BUNDLE_GEMFILE=Gemfile.local bundle exec"
alias blo="BUNDLE_GEMFILE=Gemfile.local bundle open"

# Git
alias g="git"
[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
[ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ] && . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
__git_complete g __git_main

# Homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Ruby + Homebrew
export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"

# RabbitMQ
export PATH="$PATH:/usr/local/sbin"

# Scala
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Headless Chrome
export BROWSER_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# Golang
export GOPATH=$HOME/Projects/Go
export PATH=$PATH:$(go env GOPATH)/bin

# Postgres
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# Machinio
heroku_psql() {
  psql --variable=PROMPT1='%n@%/%R%#%x ' $(heroku config:get DATABASE_URL -a $1)
}
