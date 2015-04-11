# my own .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

case "$TERM" in
*-256color)
    alias ssh='TERM=${TERM%-256color} ssh'
    ;;
*)
    POTENTIAL_TERM=${TERM}-256color
    POTENTIAL_TERMINFO=${TERM:0:1}/$POTENTIAL_TERM

    # better to check $(toe -a | awk '{print $1}') maybe?
    BOX_TERMINFO_DIR=/usr/share/terminfo
    [[ -f $BOX_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
        export TERM=$POTENTIAL_TERM

    HOME_TERMINFO_DIR=$HOME/.terminfo
    [[ -f $HOME_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
        export TERM=$POTENTIAL_TERM
    ;;
esac

source ~/git-completion.bash

export PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"

# killscreen
# http://stackoverflow.com/questions/1509677/kill-detached-screen-session
killscreen () {
    screen -X -S  $1 quit
}

# extract any file
# http://serverfault.com/a/3842/277442
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
 
 # color man page
 # http://serverfault.com/a/12391/277442
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
 
# navigation up
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."

# fawk
# https://gist.github.com/anonymous/8cfd9652085061dbebf5
function fawk() {
    USAGE="\
usage:  fawk [<awk_args>] <field_no>
        Ex: getent passwd | grep andy | fawk -F: 5
"
    if [ $# -eq 0 ]; then
        echo -e "$USAGE" >&2
        return
        #exit 1 # whoops! that would quit the shell!
    fi
 
    # bail if the *last* argument isn't a number (source:
    # http://stackoverflow.com/a/808740)
    last=${@:(-1)}
    if ! [ $last -eq $last ] &>/dev/null; then
        echo "FAWK! Last argument (awk field) must be numeric." >&2
        echo -e "$USAGE" >&2;
        return
    fi
 
    if [ $# -gt 1 ]; then
        # Source:
        # http://www.cyberciti.biz/faq/linux-unix-bsd-apple-osx-bash-get-last-argument/
        rest=${@:1:$(( $# - 1 ))}
    else
        rest='' # just to be sure
    fi
    awk $rest "{ print  \$$last }"
} # fawk

# git
alias gc="git commit -m"
alias ga="git add"
alias gs="git status"

# replace function name
replaceName () {
# TODO add sanity check
    if [[ "$OSTYPE" == "darwin"* ]]; then
        find . -type f -print0 | xargs -0 sed -i '' "s/"$1"/"$2"/g"
    else
        find . -type f -print0 | xargs -0 sed -i "s/"$1"/"$2"/g"
    fi
}
