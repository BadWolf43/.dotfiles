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
#PS1="\[\e[38;5;52m\]-\[\e[38;5;1m\]-\[\e[38;5;9m\]-\[\e[38;5;240m\][\[\e[38;5;99m\]\u\[\e[38;5;240m\]]\[\e[38;5;240m\]-[\[\e[38;5;49m\]\w\[\e[38;5;240m\]]-\[\e[0m\]\n\[\e[38;5;49m\]~$\[\e[0m\] "

PS1="\[\e[38;5;52m\]-\[\e[38;5;1m\]-\[\e[38;5;9m\]-\[\e[38;5;240m\][\[\e[38;5;99m\]\u\[\e[38;5;49m\]@\[\e[38;5;165m\]\h\[\e[38;5;240m\]]\[\e[38;5;240m\]-[\[\e[38;5;49m\]\w\[\e[38;5;240m\]]\[\e[0m\]\n\[\e[38;5;49m\]~$\[\e[0m\] "

#--------------------------------------------- SSH Menu
alias sshmenu='$HOME/.scripts/other/ssh-menu.sh'
#--------------------------------------------- My aliases
alias SS='sudo systemctl'
alias SP='sudo pacman'
alias aliases='cat $HOME/.bash_aliases'
alias vimhelp='cat /srv/Documents/vimhelp.txt'          # My vim Cheat Sheet
alias bup='source ~/.bash_aliases'                      # Updates .bash_alaises (must be used on EACH pane)
alias tup='tmux source-file ~/.config/tmux/config'      # Updates tmux (must be used on EACH pane)
alias xup='xrdb $HOME/.Xresources'                      # Update the .Xresources database (must re-open each terminal/app)
alias tmux='tmux -f ~/.config/tmux/config'              # Load custom tmux config
alias python='python3'
alias py='python3'
alias pip='pip3'
alias i3c='nano $HOME/.config/i3/config'
alias i3bc='nano $HOME/.config/i3blocks/config'
alias Xres='nano $HOME/.Xresources'
alias dotfiles='/usr/bin/git --git-dir=$HOME/repos/.dotfiles/ --work-tree=$HOME'

#--------------------------------------------- List and Search
alias ls='ls --color=auto'
alias ll='ls -AhlF'
alias nn='nano'
alias snn='sudo nano'
alias sb='subl'
alias sf='screenfetch'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias dir='dir -AlhF --color=auto'
alias emoji='$HOME/.scripts/other/emoji_support.sh'
#alias tt='tree -gpush'
#alias todo='calcurse '

# --------------------------------------------[ tail logs and eMails ]
alias mail='tail -f -n 25 /var/mail/root'		# tail root eMail
#alias syslog='colortail -k ~/.config/colortail/rsyslog.conf -f /var/log/syslog'
alias syslog='tail -n 50 -f /var/log/syslog'
# --------------------------------------------[ Navigation ]

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
#Allows you to cd into a directory by typing the directory name
shopt -s autocd

alias c='clear'
alias ee='exit'


# --------------------------------------------[ Utilities ]
alias mx='alsamixer'               # alsa audio mixer
alias music='ncmpcpp'              # mpd music player client
#alias rm='rm -i'                  # add confirmation to delete
#alias diff='colordiff'            # install colorediff package

alias dfc='dfc -Td'

alias reboot='sudo shutdown -r'
alias shutdown='sudo shutdown -P'
alias mount='mount | column -t'
#alias date='date +"%m-%d-%Y | %H:%M:%S"'
## Calendar
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
#alias fslint='/usr/share/fslint/fslint/fslint'		# fslint {directory}
