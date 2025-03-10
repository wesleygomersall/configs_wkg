#/bin/bash


touch $(printf '%s_%s' $(date "+%Y%m%d-%H.%M.%S.%Z") $1)
