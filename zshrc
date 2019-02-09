#!/usr/bin/env zsh

export DOTFILES=$HOME/.dotfiles
INCLUDES=$HOME/.local/share/dotfiles/zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ---------------------- Key Bindings --------------------------

bindkey -v                                          # make it vim like
bindkey '^?' backward-delete-char                   # backspace
bindkey '^@' autosuggest-execute                    # ctrl+space
bindkey '^X@s' autosuggest-accept                   # winkey+space
bindkey '^[.' insert-last-word                      # alt+.
bindkey '\e[A' history-beginning-search-backward    # up
bindkey '\e[B' history-beginning-search-forward     # down
bindkey '\e[1;5C' forward-word                      # ctrl+right
bindkey '\e[1;5D' backward-word                     # ctrl+left
bindkey '\e[H' beginning-of-line                    # home
bindkey '\e[F' end-of-line                          # end
bindkey '\e[3~' delete-char                         # del
bindkey '\e[2~' quoted-insert                       # insert
bindkey '\e[5~' beginning-of-history                # pageup
bindkey '\e[6~' end-of-history                      # pagedown

bindkey '\e[1~' beginning-of-line                    # home(tmux)
bindkey '\e[4~' end-of-line                          # end(tmux)
# ---------------------- Prompt --------------------------

setopt prompt_subst # allow variables expansion in prompt

git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "$BRANCH"

    if [ ! -z "$(git status --short)" ]; then
      echo " %F{red}✗"
    else
      echo " %F{green}✔"
    fi
  fi
}

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%F{yellow}[NORMAL] %F{reset}"
    ERROR_CODE_PROMPT="%(?..%F{red}%? ↵ %F{reset})"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$ERROR_CODE_PROMPT $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

PS1=$'%{\e[1;34m%}%~%F{cyan}$(git_prompt)%F{reset} %B$%b ' # %{\e[1;34m%} = lightblue
# PS1="%F{blue}%~%F{cyan}$(git_prompt)%F{reset} %B$%b " # %{\e[1;34m%} = lightblue

# ---------------------- Source ~/.zshrc --------------------------

# function source_zshrc {
#     source ~/.zshrc
# }
# zle -N source_zshrc
# bindkey '^[[19~' source_zshrc  # F8 = source ~/.zshrc


# ---------------------- Arrow key selection --------------------------

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

autoload -U compinit && compinit
zmodload -i zsh/complist

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
