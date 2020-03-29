### Intended for Catalina to be ran in this repo with bundle file.  

## Initial Setup
# prereq - initializes xcode 
sudo xcode-select --install

# install homebrew - package manager used for shell apps and `cask` for os x applications and services
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install brewfile brew, cask, and mas packages, including zsh
brew bundle

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# set zsh as default shell for user 
chsh -s /bin/zsh


## Timezone
# set timezone 
sudo systemsetup -settimezone "America/Chicago"

# get current zone 
# sudo systemsetup -gettimezone

# get list of potential zones 
# sudo systemsetup -listtimezones.


## Menu aka Mac Bar 
# have a look at potential menu bar options 
# ls /System/Library/CoreServices/Menu\ Extras/ 

# edit plist manually with Xcode 
# open -a Xcode ~/Library/Preferences/com.apple.systemuiserver.plist


# fix menu bar - warning if system doesn't have one of these like AirPort or Bluetooth it will break
defaults write com.apple.systemuiserver menuExtras -array \
"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
"/System/Library/CoreServices/Menu Extras/Clock.menu" \
"/System/Library/CoreServices/Menu Extras/Displays.menu" \
"/System/Library/CoreServices/Menu Extras/Volume.menu" \

# refresh ui
killall SystemUIServer

# change clock format 
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm:ss" 

# refresh ui
killall SystemUIServer


## Security
# enable stealth mode to disable ping response ect.. 
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

# enable basic firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1


## Set Energy Saver Settings
# -a,ac,b,u = all, ac/adapter, battery, ups 

# sets display sleep time, disksleap, sleep, enabling wake on ethernet and wake on modem ring on ac 
sudo pmset -ac displaysleep 15 disksleep 30 sleep 45 womp 1 ring 1

# sets display sleep time, disksleap, sleep, enabling wake on ethernet and wake on modem ring on battery 
sudo pmset -b displaysleep 2 disksleep 3 sleep 4 womp 0 ring 0

# sets the system to shutdown after x minutes, the ups is reporting <=y% battery or <=z minutes remaining
sudo pmset -u haltafter 2 haltlevel 25 haltremain 60

## Trackpad 
# tap to click, double tap/click for right click 
# 3 finger drag enabled
# 3 finger spread/ collapse for desktop and applications page
# 4 finger swipe between apps 
defaults write com.apple.AppleMultitouchTrackpad ActualStrength -int 0
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0

## Dock 
# Remove all to initially reset dock
dockutil --remove all --allhomes

# add apps 
dockutil --add '/System/Applications/System Preferences.app' --allhomes  
dockutil --add '/Applications/iTerm.app' --allhomes
dockutil --add '/Applications/Visual Studio Code.app' --allhomes
dockutil --add '/Applications/Google Chrome.app' --allhomes  
dockutil --add '/Applications/Firefox.app' --allhomes  
dockutil --add '/Applications/Notion.app' --allhomes  
dockutil --add '/Applications/Todoist.app' --allhomes
dockutil --add '/System/Applications/Calendar.app' --allhomes
dockutil --add '/System/Applications/Contacts.app' --allhomes
dockutil --add '/Applications/Pocket.app' --allhomes  
dockutil --add '/Applications/Signal.app' --allhomes  
dockutil --add '/Applications/Pulse SMS.app' --allhomes  
dockutil --add '/Applications/Spotify.app' --allhomes

# add folders 
dockutil --add '~/' --view grid --sort name
dockutil --add '/Applications' --view grid --display folder --allhomes --sort name
dockutil --add '/Applications/Utilities' --view grid --display folder --allhomes --sort name
dockutil --add '~/Downloads' --view grid --display folder --allhomes --sort dateadded


## Setup Py Env
# for py
pip install ipython