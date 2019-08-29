#     _               _                     _ _
#    | |             | |                   | (_)
#    | |__   __ _ ___| |__  _ __ ___   __ _| |_  __ _ ___  ___  ___ 
#    | '_ \ / _` / __| '_ \| '__/ __| / _` | | |/ _` / __|/ _ \/ __|
#    | |_) | (_| \__ \ | | | | | (__ | (_| | | | (_| \__ \  __/\__ \
#    |_.__/ \__,_|___/_| |_|_|  \___| \__,_|_|_|\__,_|___/\___||___/
#                                 ______
#                                |______|
#
#--------------------------------------------- My root Prompt
PS1="\[\e[38;5;52m\]-\[\e[38;5;1m\]-\[\e[38;5;9m\]-\[\e[38;5;240m\][\[\e[38;5;99m\]\u\[\e[38;5;49m\]@\[\e[38;5;165m\]\h\[\e[38;5;240m\]]\[\e[38;5;240m\]-[\[\e[38;5;49m\]\w\[\e[38;5;240m\]]\[\e[0m\]\n\[\e[38;5;49m\]~$\[\e[0m\] "

#--------------------------------------------- SSH Menu
alias sshmenu='/mnt/storage/Scripts-X1e/ssh-menu/ssh-menu.sh'
#--------------------------------------------- My aliases
alias SS='sudo systemctl'
alias SP='sudo pacman'
alias aliases='cat $HOME/.bash_aliases'
# My vim Cheat Sheet
alias vimhelp='cat /srv/Documents/vimhelp.txt'
# Updates .bash_alaises (must be used on EACH pane)
alias bup='source ~/.bash_aliases'
# Updates tmux (must be used on EACH pane)
alias tup='tmux source-file ~/.config/tmux/config'
# Update the .Xresources database (must re-open each terminal/app)
alias xup='xrdb $HOME/.Xresources'
# Load custom tmux config
alias tmux='tmux -f ~/.config/tmux/config'
alias python='python3'
alias py='python3'
alias pip='pip3'
alias i3c='nano $HOME/.config/i3/config'
alias i3bc='nano $HOME/.config/i3blocks/config'
alias i3bc2='nano $HOME/.config/i3blocks/config_bar2'
alias Xres='nano $HOME/.Xresources'
alias dotfiles='/usr/bin/git --git-dir=$HOME/repos/.dotfiles/ --work-tree=$HOME'
# Stress/Monitor CPU tests
alias stui='s-tui'
alias rdphome='rdesktop -g 3740x2060 -P -z -x l -r sound:off -u rnader 76.110.17.183:3399'

#--------------------------------------------- List and Search
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -AhlFN --group-directories-first'
alias lsd='ls -d */'
alias lld='ll -AhlFNd */'
alias kk='echo Dumbass, theres no kk'
alias nn='nano'
alias snn='sudo nano'
# open sublime text
alias sb='subl'
alias sf='screenfetch'
alias nf='neofetch'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias dir='dir -AlhF --color=auto'
alias emoji='$HOME/.scripts/rofi/emoji_rofi.sh'
#alias tt='tree -gpush'
#alias todo='calcurse '

# --------------------------------------------[ eMail ]
#alias mbsync='mbsync -c ~/.config/mbsync/mbsyncrc'
# --------------------------------------------[ tail logs ]
#alias syslog='colortail -k ~/.config/colortail/rsyslog.conf -f /var/log/syslog'
alias syslog='tail -n 50 -f /var/log/syslog'
# --------------------------------------------[ Navigation ]

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias c='clear'
alias ee='exit'
# Allows you to cd into a directory by typing the directory name
shopt -s autocd

# --------------------------------------------[ Directories ]
alias sc='cd ~/.scripts'
alias cf='cd ~/.config'
alias mn='cd /mnt'
alias st='cd /mnt/storage'
alias atl='cd /mnt/atlas_nfs'

# --------------------------------------------[ Utilities ]
# alsa audio mixer
alias mx='alsamixer'
# mpd music player client
alias music='~/.config/ncmpcpp/launch.sh'
alias calcurse='calcurse -D ~/.config/calcurse/'
#alias rm='rm -i'                  # add confirmation to delete
#alias diff='colordiff'            # install colorediff package

alias dfc='dfc -Td'

alias reboot='sudo shutdown -r'
alias shutdown='sudo shutdown -P'
alias mount='mount | column -t'
#alias date='date +"%m-%d-%Y | %H:%M:%S"'
## Calendar
alias cal='cal | lolcat'
## Ports
alias ports='ss'
#alias rearbackup='rear -v mkbackup'

# --------------------------------------------[ My root Scripts]
#alias tmenu='/srv/Documents/Scripts/WhatBox_Scripts/tmenu.sh'
## Edit Colortail 'rsyslog.conf'
#alias ct='nano .config/colortail/rsyslog.conf'
## Edit the 'topydo and topydo columns' ToDo list
#alias t=' topydo -c ~/.config/topydo/topydo.conf'
#alias tt='topydo columns -l ~/.config/topydo/topydo_columns.conf'
## Print all 256 color codes
alias colors='for i in {0..255}; do printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo ; fi ; done'
# h.sh hhighlighter script
#. /usr/local/bin/h.sh

# Search for duplicate or redundant files/folders with fslint
#alias fslint='/usr/share/fslint/fslint/fslint'     # fslint {directory}
