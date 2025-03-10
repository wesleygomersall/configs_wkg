#/bin/bash

touch $(printf '%s_%s' $(date "+%Y%m%d") $1)
