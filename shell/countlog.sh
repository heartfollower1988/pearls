if [ $# -lt 1 ];then
    echo 'Usage: ./countlog.sh target'
fi

target=$1
grep -rI $target log > $target.log
sed -i 's/[0-9]//g' $target.log
sort $target.log | uniq -c > $target.tmp
sed -i 's/^ \+//1' $target.tmp
sort -nr $target.tmp > $target.log
rm $target.tmp

