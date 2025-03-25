#!/bin/zsh


cat $1 | grep -o \"https://clutch.co/profile/\[a-z0-9\-\]\* | cut -c2-

