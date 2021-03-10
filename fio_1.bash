#!/bin/bash


findfioprocess=$(ps -fe|grep 'fio'|awk '{print $8}')
while   [ "$findfioprocess" != "fio" ]
do  
 cd /data/
 for i in $(seq 80); 
 do name=$(printf test%02d.txt $i);
 fio -filename=/data/$name  -iodepth=64 -ioengine=libaio -direct=1 -rw=write -bs=16m -size=256g -numjobs=1 -group_reporting -name=test-write
 done


 sleep 1


if [ "$findfioprocess" != "fio" ]
then
cd /data/
for i in $(seq 80); 
do name=$(printf test%02d.txt $i);
fio -filename=/data/$name  -iodepth=64 -ioengine=libaio -direct=1 -rw=write -bs=16m -size=256g -numjobs=1 -group_reporting -name=test-write
done


else
 
 continue
 fi
 
done 
