alias tma='tmux attach'
alias tml='tmux list-sessions'

alias gits='git status'
alias gita='git add'
alias gitc='git commit'

alias fzf='fzf --preview="cat {}"'

alias IGV='IGV_Linux_2.18.4/igv.sh & exit' # launch interactive genomics viewer and close the shell

alias storage='df -h -x devtmpfs -x tmpfs'

alias ll='ls -lah'
alias tr='tree -h'

alias newnote='vim $(printf %s "note_wkg_" $(date "+%Y%m%d-%I.%M%p") ".md")'

#scripts
scripts_dir='/home/wesley/.my_bash_scripts'
alias tm="$scripts_dir/tmux_new_or_attach.sh"
alias dttouch="$scripts_dir/datetimetouch.sh"
alias dtouch="$scripts_dir/datetouch.sh"


