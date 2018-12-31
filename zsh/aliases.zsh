alias tldr='tldr -t ocean'
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