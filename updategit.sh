#!/bin/bash

if [[ $1 == remote || $1 == local ]] ; then

	echo "From: $HOME"
	echo "Copying files: .bashrc .tmux.conf .vimrc"
	echo "To: ~/configs_wkg/$1/"

	cp ~/.bashrc ~/configs_wkg/$1/
	cp ~/.tmux.conf ~/configs_wkg/$1/
	cp ~/.vimrc ~/configs_wkg/$1/

else 

	echo "Invalid arguments. Use 'remote' or 'local' to specify which folder to copy to."

fi
