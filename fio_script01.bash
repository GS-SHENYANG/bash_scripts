#！/usr/local/bin/bash

#fio test scripts
#by 27382901@QQ.COM
#TrueNAS FreeBSD 12.2-RELEASE-p2

#DEFINE THE FIO  OPTIONS
#I/O type 
io_type_var="read write randwrite randread rw randrw"
# Block size,default bs=4k, for default use
# I/O size,in my scripts its a const 200G
io_size=200G
# I/O engine 
io_engine_var=psync 
# I/O depth ,use 64
io_depth_var=64
# I/O type ,buffered=true for default
# target file
target_file=data.log


#dont show not in used
echo "$io_size" "$io_engine_var" "$io_depth_var" "$target_file"


for rw_str in $io_type_var 
do
        echo "io_type is: $rw_str" 
done