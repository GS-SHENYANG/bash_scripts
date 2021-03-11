    #!usr/local/bin/bash

    fio -filename=test -iodepth=1 -numjobs=1 -thread -rw=randwrite -bs=4k -ioengine=libaio -group_reporting -name=mytest -randrepeat=0 -time_based -runtime=300 -direct=1

    fio -direct=1 -iodepth=12 -rw=rw -ioengine=rbd -bs=4K -group_reporting -name=test -numjobs=4 -runtime=600 clientname=admin -pool=pool-4f54c712d0fc4ae494d924031cb0f81f -rbdname=volume-b54cffb2fe31417695d819bb40af4c6f

    fio -thread -ioengine=libaio -group_reporting -name=mytest -randrepeat=0 -time_based -runtime=300 -direct=1 rwmixread=70 -filename=/dev/sdi:/dev/sdj -rw=randrw -bs=4k -numjob=1 --iodepth=128

参数解释：

-rw=read(100%顺序读) -rw=write（100%顺序写） -rw=randread（100%随机读） -rw=randwrite（100%随机写）,
-rw=rw -rwmixread=70,混合顺序70%读30%写
-direct=1绕过内存 -iodepth 1队列长度
-thread -numjobs=30 线程，如果没有thread就是进程。
-runtime=10秒
-name=mytest 作业名称
-filename=指定测试设备
group_reportig 开启报告，要不然得单独统计每个线程 跑的结果
bs=4k ，指定测试粒度。
size=200GB，指定测试数据量。也可以不指定。
ioengine=libaio，指定测试引擎。

bssplit=blocksize/percentage;blocksize/percentage

bssplit=4k/10:64k/50;32k/40

­random_generator=str