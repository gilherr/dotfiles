export EDITOR=vim


### Fuzzy Finder ###

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'

# export FZF_CTRL_T_OPTS='--preview "head -$LINES {}" --color light --margin 5,20'

#change ctrl+t to ctrl+p
bindkey -r '^T'
bindkey '^P' fzf-file-widget
