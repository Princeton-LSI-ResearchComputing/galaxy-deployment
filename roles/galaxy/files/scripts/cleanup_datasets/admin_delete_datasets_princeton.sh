#!/bin/sh

cd `dirname $0`/../..
TODAY=$(date +"%Y-%m-%d")
LOG_FILE=../logs/cleanup_datasets_${TODAY}.log
NOW=$(date +"%Y-%m-%d %H:%M:%S")
HEADER="\
\n\
===================\n\
admin_delete_datasets.log\n\
${NOW}\n\
==================="
echo -e "${HEADER}" >> ${LOG_FILE}
python ./scripts/cleanup_datasets/admin_cleanup_datasets.py ./universe_wsgi.ini -d 90 --tool_id=princeton_htseq --template=./scripts/cleanup_datasets/admin_princeton_htseq_import_cleanup_email.txt >> ${LOG_FILE}
