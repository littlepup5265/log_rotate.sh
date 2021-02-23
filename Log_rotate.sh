

#!/bin/bash 
touch /script_logs/test.log
MaxFileSize=2048
while true
do
     sh test.sh >> /script_logs/test.log
#Get size in bytes** 
    file_size=`du -b /script_logs/test.log | tr -s '\t' ' ' | cut -d' ' -f1`
    if [ $file_size -gt $MaxFileSize ];then   
        timestamp=`date +%s`
        mv /script_logs/test.log /script_logs/test.log.$timestamp
        touch /script_logs/test.log
    fi

done

DATE=`date +%d%h-%I%p` 
BASE_DIR='/var' 
if [ -f $BASE_DIR/logname.log ]; then 
    cp $BASE_DIR/logname.log $BASE_DIR/logname.log.$DATE 
    > $BASE_DIR/logname.log 
    compress $BASE_DIR/logname.log.$DATE 
fi 

find $BASE_DIR -name 'logname.log.*' -a -mtime +3 -exec rm {} \; 




#!/bin/bash

#Script to back up /MQHA/BROKER/logs/user.log to /full/path/to/file
#This script is set to run once a day. When ${i} gets larger then ${MAX_FILE_SIZE}
#The user.log will back to ${BACK_UP_FILE}.
#Fills older then 30 day will be removed from ${BACK_UP_FILE}

  
DATE='date +%y%m%d'
MAX_FILE_SIZE=2KB
FILE_SIZE=du -b $(i)
BACK_UP_FILE=/full/path/to/file

for i in $(/MQHA/BROKER/logs/user.log)
do
 if [ "$FILE_SIZE" -gt $"MAX_FILE_SIZE"  ];
        then
        cp ${i} ${i}.$DATE >>
		${BACK_UP_FILE}
       
 fi
		find ${BACK_UP_FILE} -iname '*.${DATE}' -mtime +30 -exec rm '{}' \;  
done 		