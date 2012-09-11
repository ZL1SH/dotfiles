#Color table from: http://www.understudy.net/custom.html
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
#Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}
 
#Set the auto completion on
autoload -U compinit
compinit
autoload -Uz vcs_info
 
#Lets set some options
setopt correctall
setopt autocd
setopt auto_resume
setopt share_history
setopt inc_append_history
 
## Enables the extgended globbing features
setopt extendedglob
 
#Set some ZSH styles
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac


 
HISTFILE=~/.zsh_history
HISTFILESIZE=65536  # search this with `grep | sort -u`
HISTSIZE=4096
SAVEHIST=4096
 
#Aliases

alias vi='vim'
#alias ls='ls -F --color'
alias l='ls -lFh'
alias la='ls -la'
alias lr='ls -tRFh'
alias lt='ls -ltFh'
alias ll='ls -lh'
alias df='df -h'
alias pssh='ssh -o "ProxyCommand ssh $PSSH_HOST nc -w1 %h %p"'
alias dirtree="ls -R | grep \":$\" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias tc='top -o cpu'
alias tm='top -o vsize' 


##cd, because typing the backslash is ALOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

# Functions
#
# started

mkgo (){
mkdir $1 && cd $1
}

function precmd {
    vcs_info
    PROMPT="${(l:$COLUMNS::=:)}
    ${fg_green}%n@%m ${fg_red}%D %T${fg_white} ${vcs_info_msg_0_}
    ${fg_white}[${fg_purple}%~${fg_white}] ${fg_dgray}ƵƩ ${fg_yellow}"
}
