#! /bin/bash

connected=$(nmcli dev status | grep wifi | grep -o unavailable)

if [ "$connected" == "unavailable" ]; then
    nmcli radio wifi on
fi
if [ "$connected" == "" ]; then
    nmcli radio wifi off
fi
