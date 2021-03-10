#!/bin/sh
for disk in $(lsblk -n -d | sort | awk '{print $1}'); do
    curDev="/dev/$disk"

    if [ "$curDev"x != "/dev/sdat"x ]; then
        echo "testing $curDev"
        fio -filename=$curDev -direct=1 -iodepth 1 -thread -rw=write -ioengine=psync -bs=16k -size=10G -numjobs=30 -runtime=120 -group_reporting -name=seqwritetest
        fio -filename=$curDev -direct=1 -iodepth 1 -thread -rw=read -ioengine=psync -bs=16k -size=10G -numjobs=30 -runtime=120 -group_reporting -name=seqreadtest
        fio -filename=$curDev -direct=1 -iodepth 1 -thread -rw=randwrite -ioengine=psync -bs=16k -size=10G -numjobs=30 -runtime=120 -group_reporting -name=randomwritetest
        fio -filename=$curDev -direct=1 -iodepth 1 -thread -rw=randread -ioengine=psync -bs=16k -size=10G -numjobs=10 -runtime=120 -group_reporting -name=randomreadtest
        fio -filename=$curDev -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=16k -size=20G -numjobs=30 -runtime=300 -group_reporting -name=mixreadwrite -ioscheduler=noop
    fi

done
