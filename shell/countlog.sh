#!/bin/sh

target_list=(info err warn)

for target in ${target_list[@]}
do
	echo >$target.log

    server_log_path=$1
    if [ ! -d $server_log_path ]; then
        echo $server_log_path not exsit
        continue
    fi
    grep -rI --no-filename $target $server_log_path >> $target.log

	#done
	totalcount=`wc -l $target.log`
	sed -i 's/[0-9]//g' $target.log
	sort $target.log | uniq -c > $target.tmp
	sed -i 's/^ \+//1' $target.tmp
	echo $totalcount > $target.log
	sort -nr $target.tmp >> $target.log
	rm $target.tmp
done
