#     _               _              
#    | |             | |             
#    | |__   __ _ ___| |__  _ __ ___ 
#    | '_ \ / _` / __| '_ \| '__/ __|
#    | |_) | (_| \__ \ | | | | | (__ 
#    |_.__/ \__,_|___/_| |_|_|  \___|

#----------------------------------------------------------------------------[ My Functions]
## Disable ctrl+s and ctrl+q
stty -ixon

## Icons-In-Terminal
source ~/.local/share/icons-in-terminal/icons_bash.sh

# Alias definitions
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
