#!/bin/bash

# Counts the number of available downloads on WhatBox
#-----------------------------------------------------
# This script requires your ssh key to be on the WB server.

#user=$(cat ~/.creds/.whatbox)
user=$(sed -n "1p" ~/.creds/.whatbox)
host=$(sed -n "2p" ~/.creds/.whatbox)

# Remote directories
remote_music='~/_Music/'
remote_movies='~/_Movies/'
remote_tv='~/_TV/'
remote_files='~/_Files/'
remote_other='~/_Other/'
list_ready='~/.scripts/whatbox/list_ready.sh'


icon=~/.icons/dunst/rutorrent-icon.png
title_fg="foreground='#E8E713'"


case $BLOCK_BUTTON in
#     1) notify-send -i $icon \

# ssh -T "${user}"@"${host}" \
# $(echo ls ${remote_music}) \

# echo -e "\n[MUSIC]--------------------\n"
# # ls ${remote_music}


# exit ;;

    3) notify-send  -i $icon \
    "<span $title_fg><u><b>WhatBox Module</b></u></span>

- Number of completed torrents
  ready to be downloaded."  ;;
esac
#-----------------------------------------------------
# Connecting to WB
ssh -T "${user}"@"${host}" << EOF


# Output to i3blocks
echo "🎧" | tr -d '\n'
ls ${remote_music} | wc -l | tr -d '\n'

echo " 🎬" | tr -d '\n'
ls ${remote_movies} | wc -l | tr -d '\n'

echo " 📺" | tr -d '\n'
ls ${remote_tv} | wc -l | tr -d '\n'

echo " 📄" | tr -d '\n'
ls ${remote_files} | wc -l | tr -d '\n'

echo " 💾" | tr -d '\n'
ls ${remote_other} | wc -l | tr -d '\n'

#-----------------------------------------------------
# music 
# ls ${remote_music} | wc -l
# # moves 
# ls ${remote_movies} | wc -l
# # tv 
# ls ${remote_tv} | wc -l
# # files 
# ls ${remote_files} | wc -l
# # other 
# ls ${remote_other} | wc -l
# -----------------------------------------------------


# echo -e "\n[MUSIC]--------------------\n"
# ls ${remote_music}

# echo -e "\n[MOVIES]-------------------\n"
# ls ${remote_movies}

# echo -e "\n[TV]-----------------------\n"
# ls ${remote_tv}

# echo -e "\n[FILES]--------------------\n"
# ls ${remote_files}

# echo -e "\n[OTHER]--------------------\n"
# ls ${remote_other}

# echo -e "\n---------------------------\n"

EOF
exit

