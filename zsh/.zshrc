#enable vi-mode
#when open zsh terminal is in Insert mode
#jk (see below) to go Normal mode / i or a back to Insert mode
bindkey -v

#make VI mode transition faster
export KEYTIMEOUT=10
#When switching modes in VIM backspace key stops working, to fix:
bindkey "^?" backward-delete-char

#Change the ESC to jk
bindkey -M viins 'jk' vi-cmd-mode

#PROMPT with indication of current vim mode
function zle-keymap-select zle-line-init {
   case $KEYMAP in
    vicmd) PROMPT='%F{110}'[n]' %2~ '$'\n''%F{110}'$'\U27a4'' ';;
    viins|main) PROMPT='%F{110}'[i]' %2~ '$'\n''%F{110}'$'\U27a4'' ';;

   esac

   zle reset-prompt
   zle -R
}

function zle-line-finish {
    PROMPT='%F{110}'[n]' %2~ '$'\n''%F{110} '$'\U27a4'' '
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select


#add empty line before prompt
precmd() { print "" }


#TAB completion
#http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/

zmodload zsh/complist
plugins=(... zsh-completions)
autoload -U compinit && compinit

setopt always_to_end	        #move cursor to end of the word
setopt auto_list		#list all choices
setopt auto_menu		#use menu completion
setopt histignorespace
#configure completion
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete

#HISTORY
HISTFILE=$HOME/dotfiles/zsh/.zsh_history
HISTSIZE=1024
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history

setopt completealiases      #complete aliases
setopt correct              #spelling correction for commands

#Misc
setopt auto_cd	#cd by typing directory name if it is not a command (e.g. go will not work)

#ALIAS 
alias cls='clear'
#source this file
alias reload='source $HOME/.zshrc'
alias info='neofetch'
#pretty print echo $PATH
alias path="echo $PATH | tr ':' '\n'"

alias ls="ls -FGlAhp"
#list only dotfiles
alias lsd='ls -d .*'
#list npm global modules
alias lsg='ls -l $(npm root -g)'
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
#start new tmux session and name it with current directory
alias tat="tmux new-session -As $(basename $PWD | tr . -)"

#FUNCTIONS can take arguments


#increase volume of media
function upvolume() {
     readonly input=${1:?"Input File must be specified"}
     match=".mp4"
     insert="bbb"

     output="${input%%${match}*}${insert}${match}${input##*${match}}"

     command ffmpeg -i "$input" -filter:a "volume=1.5" "$output"

     #echo ${output}
}
#convert to mp4
function 2mp4() {
  readonly input=${1:?"Input File must be specified"}
  #readonly output=${2:?"Output must be specified"}
  suffix="-hls.ts"
  output=${input%"$suffix"}
  output="${output}.mp4"

     #command ffmpeg -y -i "$input" -vcodec copy -acodec copy -map 0:v map 0:a "$output"
     command ffmpeg -y -i "$input" -vcodec copy -acodec copy "$output"
}

#get my ip
function whatismyip() {
     command ipconfig getifaddr en0
}
#make and cd to new dir
function mkcd() {
	command mkdir -pv $1 && cd $1
}

#open pdf in terminal
function pdf() {
   readonly file=${1:?"no filename"}
   pdftotext "$1" -  | less
}

#view MS Word doc in terminal
function doc() {
     readonly file=${1:?"no file specified"}
     textutil -stdout -cat txt $1
}

#test load time Shell
timezsh() {
     shell=${1-$SHELL}
     for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

export PATH="/usr/local/sbin:$PATH"

#Golang env variables to path ~/Develop/go
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/Develop/go"
export GOBIN="$HOME/Develop/go/bin/"

export GO111MODULE=on

#Godoc path
export PATH="$HOME/Develop/go/bin:$PATH"

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

export MYTUBE_DB_DSN='postgres://devdk:9642kbKB@localhost/mytube?sslmode=disable'
#export MYTUBE_DB_DSN='postgres://devdk:9642kbKB@localhost/mytube'

#just for funs
fortune | cowsay -n | lolcat


#antibody plugin manager
source <(antibody init)

#antibody bundle githubuser/reponame
#(or for testing at cli : antibody bundle githubuser/reponame)

antibody bundle zsh-users/zsh-autosuggestions
#keep this as last bundle
antibody bundle zsh-users/zsh-syntax-highlighting





[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
