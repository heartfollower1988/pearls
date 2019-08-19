#!/bin/python
import sys
import os

def Trans2MB(mem_txt):
    mem = 0.0
    if mem_txt.find("g") != -1:
        mem_txt = mem_txt.rstrip('g')
        mem = float(mem_txt) * 1024
    elif mem_txt.find("m") != -1:
        mem_txt = mem_txt.rstrip('m');
        mem = float(mem_txt)
    else:
        mem = float(mem_txt) / 1024
    return round(mem, 1)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage:./proc_toplog.sh toplog username")  
        sys.exit(-1)

    top_log = sys.argv[1]
    user_name = sys.argv[2]

    top_file = open(top_log)
    result_file_name = top_log  + ".res"
    result_file = open(result_file_name, 'w')

    cur_time = ""
    for line in top_file.readlines():
        if line.find("top - ") != -1:
            words = line.split()
            cur_time = words[2]
        elif line.find(user_name) != -1:
            words = line.split()
            vm = Trans2MB(words[4])
            rss = Trans2MB(words[5])
            cpu = words[8]
            result_file.write("{0}\t{1}\t{2}\t{3}\t \n".format(cur_time, vm, rss, cpu))
    top_file.close()
    result_file.close()
    os.system("sz {0}".format(result_file_name))
