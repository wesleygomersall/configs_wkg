alias fzf='fzf --preview="cat {}"'

alias storage='df -h -x devtmpfs -x tmpfs'

alias ll='ls -lah'
alias tr='tree -h'

alias newnote='vim $(printf %s "note_wkg_" $(date "+%Y%m%d-%I.%M%p") ".md")'

#scripts
scripts_dir='$HOME/.my_bash_scripts'
alias tm="$scripts_dir/tmux_new_or_attach.sh"
