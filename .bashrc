# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

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
source ~/prompt.bash
#PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'
export PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"
