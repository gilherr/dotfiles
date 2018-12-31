# Basics
alias l='ls -lh'
alias ll='ls -lah'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dl='docker ps -a'
alias di='docker images'
alias drmin='docker rmi $(docker images -q --filter "dangling=true")' # remove <none> containers

# Copy path
#alias xclip='head -c -1 | xclip -selection clipboard'

# Git
alias gitlog='git log --oneline --graph --decorate --all'

#### Functions ####

lg() { ls -la | grep $1 -i; }

cpath() {
  xclipInstalled=$(dpkg-query -W -f='${Status}' xclip 2>/dev/null | grep -c "ok installed")
  if [ $xclipInstalled -eq 0 ];
  then
    echo 'needs xclip to run. use "apt-get install xclip"'
    return
  fi

  filePath=$(readlink -f $1)
  echo $filePath
  echo $filePath | head -c -1 | xclip -selection clipboard
}
