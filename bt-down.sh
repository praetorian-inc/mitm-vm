#!/bin/bash
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist
while read -r line ; do
     echo $line >> disabled_mods
     sudo kextunload -b $line
done < <(kextstat -l | grep -i bluet | tr -s ' ' | cut -d' ' -f7)
