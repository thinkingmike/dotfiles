#PROMPT

#%F {110} - set Foreground color
#to reset prompt add #f after %# -> ..%# %f ''
PROMPT='
%F{110}%m %F{110}[%T] %F{111}%~ 
%F{109}%# '

#TAB completion
#http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/

zmodload zsh/complist
autoload -U compinit && compinit

setopt always_to_end	#move cursor to end of the word
setopt auto_list		#list all choices
setopt auto_menu		#use menu completion
#configure completion
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete

#enable tab completion for colorls
source $(dirname $(gem which colorls))/ #werkt (nog) niet

#HISTORY
HISTFILE=$HOME/.zsh_history
HISTFILE=1024
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history

#Misc
setopt auto_cd	#cd by typing directory name if it is not a command (e.g. go will not work)

#ALIAS are static

alias cls='clear'
#source this file
alias reload='source $HOME/.zshrc'
alias info-'archey'

alias ls="ls -FGlAhp"
alias lsc='colorls -lA --sd'
#show only dotfiles
alias lsd='ls -d .*'
alias cd..="cd .."
alias ..='cd ..'
alias mkdir='mkdir -pv'
alias cp="cp -i -R"
alias mv="mv -i"
alias rm="rm -R"
alias rsync="rsync -av"
#bat is cat with color
alias cat="bat"
#ping only 5 times
alias ping="ping -c 5"


#FUNCTIONS can take arguments

#make and cd new dir
function mkcd() {
	command mkdir -pv $1 && cd $1
}


export PATH="/usr/local/sbin:$PATH"

#Golang env variables to path ~/Develop/go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/Develop/go"
export GOBIN="$HOME/Develop/go/bin/"

export PATH="$HOME/.cargo/bin:$PATH"

#antibody plugin manager
source <(antibody init)

#antibody bundle githubuser/reponame
#(or for testing at cli : antibody bundle githubuser/reponame)
antibody bundle zdharma/fast-syntax-highlighting > ~/.zshrc.log
antibody bundle zsh-users/zsh-autosuggestions
#antibody bundle robbyrussell/oh-my-zsh path:plugins/brew#antibody bundle ohmyzsh/ohmyzsh path:plugins/colored-man-pages
#antibody bundle ohmyzsh/ohmyzsh path:plugins/golang

if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)";fi








