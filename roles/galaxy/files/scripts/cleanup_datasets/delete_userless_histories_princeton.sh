#!/bin/bash

cd `dirname $0`/../..
TODAY=$(date +"%Y-%m-%d")
LOG_FILE=../logs/cleanup_datasets_${TODAY}.log
NOW=$(date +"%Y-%m-%d %H:%M:%S")
HEADER="\
\n\
=============================\n\
delete_userless_histories.log\n\
${NOW}\n\
============================="
echo -e "${HEADER}" >> ${LOG_FILE}
python ./scripts/cleanup_datasets/cleanup_datasets.py ./universe_wsgi.ini -d 10 -1 $@ >> ${LOG_FILE}
