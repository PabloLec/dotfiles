#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

available_files=( vscode terminator zsh p10k services qbt tmux)
files_vscode=( "$HOME/.config/Code/User/settings.json" )
files_terminator=( "$HOME/.config/terminator/config" )
files_zsh=( "$HOME/.zshrc" )
files_p10k=( "$HOME/.p10k.zsh" )
files_services=( "/etc/systemd/system/vncserver@.service" )
files_qbt=( "$HOME/.config/qBittorrent/qBittorrent.conf" )
files_tmux=( "$HOME/.tmux.conf" )

create_dir () {
  if mkdir "$SCRIPT_DIR/$1" 2> /dev/null ; then
      echo " - Created dir $1"
  fi
}

copy () {
	if cp $2 "$SCRIPT_DIR/$1" ; then
	      echo " - OK: $2"
	fi
}

fetch () {
  create_dir $1
  for ((i = 2; i <= $#; i++ )); do
    copy $1 "${!i}"
  done
}

fetch_all () {
	fetch vscode $files_vscode
	fetch terminator $files_terminator
	fetch zsh $files_zsh
	fetch p10k $files_p10k
	fetch services $files_services
	fetch qbt $files_qbt
}

if [ $# == 1 ] && [ $1 == "all" ]; then
   fetch_all
   exit 0
fi

for ((j = 1; j <= $#; j++ )); do
    arg="${!j}"
    if (printf '%s\n' "${available_files[@]}" | grep -xq $arg); then
        files=files_${arg}
        fetch $arg ${!files}
    else
    	echo " ! Cannot find: $arg"
    fi
done