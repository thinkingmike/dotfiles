# Custom Prompt
export PS1="\n\h [\A] \w\n» "
export PS2="?? "

#On completion change -> 'source ~/.bash_profile'

# aliases
alias reload='source .bash_profile'
alias sleep='pmset sleepnow'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias ls="ls -FGlAhp"
#show only dot (hidden) files:
alias lsd='ls -d .*'
alias cls="clear"
alias cd..="cd .."
alias mkdir="mkdir -pv"
alias cp="cp -i -R"
alias mv="mv -i"
alias rm="rm -R"
alias rsync="rsync -av"
#bat is a better cat:
alias cat="bat"
#ping only 5 times:
alias ping="ping -c 5"
alias wget="wget --limit-rate=200k --no-clobber --continue --convert-links --random-wait -r -p -E -e robots=off -U mozilla"
alias subl="open -a /Applications/Sublime\ Text.app"
alias globalmodules="cd /usr/local/lib/node_modules/"

. /Users/Michiel/Develop/scripts/z.sh

# Needed for bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

#Set tab title in iTerm2
function title {
	echo -ne "\033]0;"$*"\007"
}

#Clean Finder
function nogo {
	defaults delete com.apple.finder GoToFieldHistory; killall Finder
}

#Function to shortcut all repeating actions in unlocodes node project
show() {
rm country.txt
node hello.js
cat country.txt
}

#Function to get my IP adress
#at KVH start server on MBP (see below) and open on safari iPhone ipadress:8000
#works!
whatismyip() {
	ipconfig getifaddr en0
}

#Function to create local server, avoid Chrome cross scripting error
#Use : createserver path (example :  createserver ~/Develop/www/map/test_area)
#In Chrome -> 127.0.0.1:8000
createserver() {
	cd $1
	python -m SimpleHTTPServer
}

export PATH="/usr/local/sbin:$PATH"

#Golang env variables to path ~/Develop/go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/Develop/go"
export GOBIN="$HOME/Develop/go/bin/"

. "$HOME/.cargo/env"
