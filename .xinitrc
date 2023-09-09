#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"

#load xprofile
[ -f ~/.config/.xprofile ] && . ~/.config/.xprofile


#execute dwm
exec dwm
