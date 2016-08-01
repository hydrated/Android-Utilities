#!/system/bin/sh
if [ -n "$1" ]
then
echo "Process $1"
else 
echo "Usage : sh log_memory.sh (process name)"
return
fi
MYPID=`pgrep $1`
echo ${MYPID}
FILENAME="memorylog"`date +%s`.log
echo "FILENAME is "${FILENAME}
while true; do
date >> ${FILENAME}  
dumpsys meminfo ${MYPID} >> ${FILENAME} 2>&1
echo >> ${FILENAME} 
echo '\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>' >> ./procrank.log
echo "Sleep 5"
sleep 5
done
