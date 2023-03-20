echo $1 $2 >>/tmp/channels.log

#channel 5
if [ $1 -eq 5 ]; then
    if [ $2 -lt 1500 ]; then
      /root/1080.sh
    else
      /root/720.sh
    fi
fi


#channel 6
if [ $1 -eq 6 ]; then
    if [ $2 -lt 1500 ]; then
      /root/ircut.sh off
    else
      /root/ircut.sh on
    fi
fi

#channel 8
if [ $1 -eq 8 ]; then
    if [ $2 -lt 1400 ]; then
      yaml-cli -s .image.luminance 40
      killall -1 majestic
    elif [ $2 -gt 1400 ] && [ $2 -lt 1600 ]; then
      yaml-cli -s .image.luminance 60
      killall -1 majestic
    else
      yaml-cli -s .image.luminance 90
      killall -1 majestic
    fi
fi
exit 1