# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="minimal"
# ZSH_THEME="robbyrussell"
ZSH_THEME="customrobby"
# ZSH_THEME="kardan"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

plugins=(
    git
    ember-cli
    ruby
    docker
    zsh-autosuggestions
    zsh-syntax-highlighting
)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source $ZSH/oh-my-zsh.sh

# ---------------------- My Settings --------------------------

export DOTFILES=$HOME/.dotfiles

# ---------------------- Key Bindings --------------------------

# bindkey -v                                          # make it vim like
bindkey ' ' autosuggest-execute                    # ctrl+space
# bindkey ' ' autosuggest-accept                   # ctrl+space
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# ---------------------- Sources --------------------------

source $DOTFILES/aliases
source $DOTFILES/env
source $HOME/.fzf.zsh

# ---------------- Less config ---------------

export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

export LESS="$LESS -FRXK"                 # dont be pager when text fit
# ----------------- Configure NPM Install Dir ---------------------

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
function npm-do { (PATH=$(npm bin):$PATH; eval $@;) } # run local bins

# ----------------- Ruby ---------------------

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH" > /dev/null 2>&1
fi

# ----------------- LS Colors ------------------------

unset LSCOLORS
export CLICOLOR=1
# export CLICOLOR_FORCE=1

# ----------------- Other ------------------------

HIST_STAMPS="%a %d %h - %T "

# ----------------- TB ------------------------

export REPO_DIR=repos
export PROJECTS_DIR="$HOME/repos"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

export REDIS_URL="redis://127.0.0.1:6379/0/tailor"

export JRUBY_OPTS="-Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF -J-Xmn512m -J-Xms1g -J-Xmx4g -X-C"

export SECRET_KEY_BASE=$rails_secret

# AWS
#export KMS_KEY_ID=arn:aws:kms:us-east-1:705382161348:key/974707ee-c27e-4f29-99eb-ba65947511e1
export KMS_KEY_ID=insecure-test-key
export AWS_PROFILE=ecr-reader

# Facebook
export tb_facebook_app_id=215579975521700
export tb_facebook_app_secret=8026e336aaefe058626701d4a43f8d20

# Google
export tb_google_client_id=""

# Unsplash
export tb_unsplash_access_key=687b13100f6277d3a3d5ed44a3d6a42d06b7a75df55587cd762a7dba5df176f3
export tb_unsplash_secret_key=2af0691cc2572f33cdc279a7c77a11e10a5155a1689d5812c192cbc1d21c4f0a

# Golang
export GOPATH=$HOME/.golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

