# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/projects/bgmp/wesg/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/projects/bgmp/wesg/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/projects/bgmp/wesg/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/projects/bgmp/wesg/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/projects/bgmp/wesg/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/projects/bgmp/wesg/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

#fix for conda to work in scripts: https://github.com/conda/conda/issues/7980
export -f conda
export -f __conda_exe
export -f __conda_activate
export -f __conda_hashr
export -f __conda_reactivate
export -f mamba
export -f __mamba_exe

PS1='[\[\e[91m\]\u\[\e[91m\]@\[\e[91m\]\h\[\e[0m\] \[\e[38;5;212m\]\W\[\e[0m\]]\$ '

#start tmux session "ssh_tmux" or attach to it if it already exists
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi
