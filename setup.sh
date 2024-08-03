#!/bin/bash

if [[ $1 == remote || $1 == local ]] ; then

	echo "From: ~/configs_wkg/$1/"
	echo "Copying files: .bashrc .tmux.conf .vimrc"
	echo "To: $HOME"

	cp ~/configs_wkg/$1/.bashrc ~
	cp ~/configs_wkg/$1/.tmux.conf ~
	cp ~/configs_wkg/$1/.vimrc ~

else 

	echo "Invalid arguments. Use 'remote' or 'local' to specify which folder to copy from."

fi
