#!/usr/bin/env bash

ping -c1 www.baidu.com &>/dev/null && echo "www.baidu.com is up" || echo "www.baidu.com is down"
# &>/dev/null 表示将ping的输出结果 给到/dev/null 也就是不显示命令执行结果
#“命令1 && 命令2 || 命令3” 的意思  命令1的返回值0 则执行命令2 否则执行 命令3

/usr/bin/python <<-EOF
print "HELLO WORLD!"
EOF
#把两个EOF中间的东西交给python解释器来执行

fio -filename=test -direct=1 -iodepth 1 -thread -rw=randread -ioengine=psync -bs=4k -size=1000G -numjobs=50 -runtime=180 -group_reporting -name=rand_100read_4k

