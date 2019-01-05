#basic alias
alias l='ls -lh'
alias ll='ls -lah'

# tldr color scheme
alias tldr='tldr -t ocean'

# Use vim, not vi
alias vi=vim

# Docker
alias d='docker'
alias dc='docker-compose'
alias dl='docker ps -a'
alias di='docker images'
alias drmin='docker rmi $(docker images -q --filter "dangling=true")' # remove <none> containers

# Git
alias gitlog='git log --oneline --graph --decorate --all'

#### Functions ####

# list and grep for the parameter
lg() { ls -la | grep $1 -i; }
