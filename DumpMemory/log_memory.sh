# log_memory Copyright (c) 2016 Hydra Chang [hydrated@msn.com] 'THE BEER-WARE LICENSE'(Revision 42):
# Hydra wrote this software. As long as you retain this notice you can do whatever you want with this stuff. If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.

#!/system/bin/sh
if [ -n "$1" ]
then
echo "Process $1"
else
echo "Usage : sh log_memory.sh (process name)"
exit
fi
mkdir -p hprof
MYPID=`pgrep $1`
echo ${MYPID}
FILENAME="memorylog"`date +%s`.log
echo "FILENAME is "${FILENAME}
while true; do
HEAPDIC="hprof/"`date +%s`.hprof
date >> ${FILENAME}
dumpsys meminfo ${MYPID} >> ${FILENAME} 2>&1
procrank >> ${FILENAME}
am dumpheap ${MYPID} ${HEAPDIC}
echo >> ${FILENAME}
echo '\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>' >> ./procrank.log
echo "Sleep 5"
sleep 5
done
