#!/bin/bash

# GitHub dotfiles


icon=~/.icons/dunst/github_icon.png
title_fg="foreground='#E8E713'"
time="10000"

git="$(git --git-dir=$HOME/repos/.dotfiles/ --work-tree=$HOME)"

gitcount="$(git --git-dir=$HOME/repos/.dotfiles/ --work-tree=$HOME status | grep 'modified' | wc -l)"
gitstatus="$(git --git-dir=$HOME/repos/.dotfiles/ --work-tree=$HOME status | grep 'modified' | awk '{ print $2 }')"
#gitadd="$(git --git-dir=$HOME/repos/.dotfiles/ --work-tree=$HOME add -A)"
#commit="$(commit -a)"
#gitpush="$(git --git-dir=$HOME/repos/.dotfiles/ --work-tree=$HOME push)"



# see .scripts/git/git_commit.sh



echo "$gitcount"

case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t $time  \
    "<span $title_fg><u><b>Modified 'dotfiles' Module</b></u></span>

[Ready to Push to GitHub]

$gitstatus
" ;;
    #2) $TERMINAL -e bash -c git_commit  ;;
    #3) $TERMINAL -hold -e bash -c "git --git-dir=$HOME/repos/.dotfiles/ --work-tree=$HOME commit -a" ;;
    #3) $TERMINAL -e $(echo "hello, what is your name?") && sleep 5s && pkill -RTMIN+8 i3blocks ;;
esac
