#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

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

fetch vscode "$HOME/.config/Code/User/settings.json"
fetch terminator "$HOME/.config/terminator/config"
fetch zsh "$HOME/.zshrc"
fetch p10k "$HOME/.p10k.zsh"
fetch services "/etc/systemd/system/vncserver@.service"
fetch qbittorrent "$HOME/.config/qBittorrent/qBittorrent.conf"


