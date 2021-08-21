fpath+=~/.zfunc
export XDG_SESSION_TYPE=X11
export PATH=$PATH:/usr/local/go/bin
export GOARCH=arm
export CGO=1
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions poetry)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'


### Aliases

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias logmail='sudo tail -50 /var/log/mail.log'
alias logcron='grep CRON /var/log/syslog'
alias logauth="tail -50 /var/log/auth.log"
alias logfail2ban="tail -100 /var/log/fail2ban.log"
alias logapacheaccess="sudo tail -100 /var/log/apache2/access.log"
alias logapacheerror="sudo tail -100 /var/log/apache2/error.log"
alias wifion="sudo modprobe brcmfmac"
alias wifioff="sudo modprobe -rv brcmfmac"
alias confssmtp='sudo nano /etc/ssmtp/ssmtp.conf'
alias deletetorrent='python3 $HOME/scripts/torrent/find_worst_torrents.py'
alias qbittorrent="QT_SCALE_FACTOR_ROUNDING_POLICY=Round qbittorrent"
alias pip="pip3"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias micro="$HOME/tools/micro"
alias ngrok="sudo /opt/ngrok"
alias remoteddwrt="sudo /opt/ngrok http 10.0.0.1:80"
alias flushiptables="sudo bash -c 'iptables -P INPUT ACCEPT && iptables -P FORWARD ACCEPT && iptables -P OUTPUT ACCEPT && iptables -t nat -F && iptables -t mangle -F && iptables -F && iptables -X'"
alias launchnovnc="/opt/noVNC/utils/launch.sh"
alias fail2jails="sudo fail2ban-client status | sed -n 's/,//g;s/.*Jail list://p' | sudo xargs -n1 fail2ban-client status"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.poetry/bin:$PATH"
