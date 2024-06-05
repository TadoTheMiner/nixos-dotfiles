#!/bin/sh
mkdir -p ~/pictures/screenshots
FILENAME="~/pictures/screenshots/$(date +'%Y-%m-%d-%H%M%S_screenshot.png')"

if [ "$1" = fullscreen ]
then
    grim $FILENAME
elif [ "$1" = region ]
then
    grim -g "$(slurp -b 11111b80 -c fab387)" $FILENAME
else
    FOCUSED=`swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.focused and .pid) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'`
    grim -g "$(eval echo $FOCUSED)" $FILENAME
fi
   
wl-copy < $FILENAME
notify-send "Screenshot" "File saved as $FILENAME\nand copied to clipboard" -t 6000 -i $FILENAME
