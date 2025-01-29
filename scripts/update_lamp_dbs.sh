#!/bin/bash

if [ -z "${1-}" ]; then
   echo "Must provide DB Password as first parameter. Exiting...."
   exit 1
fi

ssh largo '/var/lib/zhdk/scripts/export_db.sh' > local_output;
echo "done exporting DBs"
scp -3q largo:/var/lib/zhdk/db-dumps/hmtfwdb_latest.sql lamp:~/tmp/hmtfwdb_latest.sql &
scp -3q largo:/var/lib/zhdk/db-dumps/typo3db_latest.sql lamp:~/tmp/typo3db_latest.sql &
wait
echo "done copying…"
echo "starting import"
ssh lamp "mysql -uroot -p$1 -e 'DROP DATABASE zhdk_hmtfw; CREATE DATABASE zhdk_hmtfw; DROP DATABASE zhdk_typo3; CREATE DATABASE zhdk_typo3;'"
ssh lamp "mysql -uroot -p$1 zhdk_hmtfw < ~/tmp/hmtfwdb_latest.sql" &
ssh lamp "mysql -uroot -p$1 zhdk_typo3 < ~/tmp/typo3db_latest.sql" &
wait
echo "done importing…"
echo "cleaning up imported DB"
ssh lamp "mysql -uroot -p$1 -e 'USE zhdk_hmtfw; DELETE FROM raum_reservation WHERE created_date < DATE_ADD(NOW(), INTERVAL -3 MONTH);'"
echo "starting cleanup…"
ssh lamp 'rm ~/tmp/hmtfwdb_latest.sql ~/tmp/typo3db_latest.sql';
echo "done"