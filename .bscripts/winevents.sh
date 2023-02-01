#!/bin/sh
secondlast=""
lastline=""
bspc subscribe desktop_focus node_state node_add node_remove| \
    while read line; do
        echo $line
        case $line in
            node_add*)
                play -v 0.3 ~/Documents/Sounds/add.wav 2> /dev/null&
                ;;
            node_remove*)
                play -v 0.4 ~/Documents/Sounds/remove.wav 2> /dev/null&
                ;;
            *\ fullscreen\ on)
                play -v 0.4 ~/Documents/Sounds/fullscreen.wav 2> /dev/null&
                ~/.bscripts/toggle_bar.sh off&
                ;;
            *\ fullscreen\ off)
                ~/.bscripts/toggle_bar.sh on&
                ;;
            *\ tiled\ on)
                play -v 0.4 ~/Documents/Sounds/tile.wav 2> /dev/null& 
                ;;
            *\ floating\ on)
                play -v 0.4 ~/Documents/Sounds/float.wav 2> /dev/null&
                ;;
            desktop_focus*)
                play -v 0.1 ~/Documents/Sounds/change_workspace.wav 2> /dev/null&
                if [[ -z "$(bspc query -N -n focused.fullscreen)" ]]
                then
                    ~/.bscripts/toggle_bar.sh on&
                else
                    ~/.bscripts/toggle_bar.sh off&
                fi;
                ;;
            *)
                :
                ;;
        esac
        secondlast=$lastline
        lastline=$line 
    done

        

