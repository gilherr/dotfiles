# Path to your oh-my-zsh installation.
export ZSH="/home/giler/.oh-my-zsh"

ZSH_THEME="minimal"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git, docker, aws)

source $ZSH/oh-my-zsh.sh

# ---------------------- My Settings --------------------------

export DOTFILES=$HOME/.dotfiles
INCLUDES=$HOME/.local/share/dotfiles/zsh

# ---------------------- Key Bindings --------------------------

# bindkey -v                                          # make it vim like
bindkey '^@' autosuggest-execute                    # ctrl+space
bindkey '^X@s' autosuggest-accept                   # winkey+space

# ---------------------- Sources --------------------------

source $DOTFILES/aliases
source $DOTFILES/env
source $HOME/.fzf.zsh
source "$INCLUDES/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$INCLUDES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # must be last

# ---------------- Less Colors for Man Pages---------------

export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline

# ---------------------- Configure Python Path ---------------------

export PATH="$PATH:$HOME/.local/bin"    # python --user installation

# ----------------- Configure NPM Install Dir ---------------------

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# ----------------- Ruby ---------------------

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH" > /dev/null 2>&1
fi
