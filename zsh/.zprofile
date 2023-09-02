# autostart graphical session

#[ -z $DISPLAY ] || [ %(tty) = /dev/tty1 ] && echo "Display is 0 and tty1 so autostarting GUI" && exec startx
[ -z $DISPLAY -a $(tty) = /dev/tty1 ] && exec startx
