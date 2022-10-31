#!/usr/bin/env bash

end_color='\033[0m';red='\033[0;31m';
green='\033[0;32m';yellow='\033[1;33m';
function color_echo { echo -e $1$2${end_color}; }

not_on_master=()
not_clean=()
procs=()

for dir in $(find . -mindepth 1 -maxdepth 1 -type d); do
  color_echo $yellow $dir

  if [[ "$(git -C $dir rev-parse --abbrev-ref HEAD)" != "master" ]]; then
    not_on_master+=("$dir")
  elif [[ "$(git -C $dir status --porcelain)" ]]; then
    not_clean+=("$dir")
  else
    git -C $dir pull &
    procs+=("$!")
  fi
done

for pid in ${procs[*]}; do
    wait $pid
done

echo
color_echo $green "Done pulling available repos"
echo

[[ $not_on_master ]] && color_echo $yellow "Not on master branch:"
for value in "${not_on_master[@]}"; do
  echo $value
done

[[ $not_clean ]] && color_echo $yellow "Not clean:"
for value in "${not_clean[@]}"; do
  echo $value
done
