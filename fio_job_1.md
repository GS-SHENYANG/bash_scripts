    ;–start job file –

    [random-writers]

    ioengine=libaio

    iodepth=4

    rw=randwrite

    bs=32k

    direct=0

    size=64m

    numjobs=4

    ;–end job file–

等同于

    fio –name=random-writers –ioengine=libaio –iodepth=4 –rw=randwrite –bs=32k –direct=0 –size=64m –numjobs=4

