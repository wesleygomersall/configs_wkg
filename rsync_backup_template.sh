#!/bin/bash

SOURCE='/path/to/source/directory/'
TARGET='/path/to/target/directory/'
IGNORE='/path/to/ignore_file'

rsync -ah --exclude-from=$IGNORE --info=progress2 --dry-run $SOURCE $TARGET

read -p $'Continue (y/n)?\n' CONT
if [[ "$CONT" =~ ^[Yy]$ ]]; then

	rsync -ah --exclude-from=$IGNORE --info=progress2 $SOURCE $TARGET

else
	echo "Sync aborted"
  	exit
fi
