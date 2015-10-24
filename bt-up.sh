#!/bin/bash
sudo launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist
while read -r line ; do
     sudo kextload -b $line
 done < <(cat disabled_mods)
