#!/bin/python
#coding=utf-8
import sys
import os
import re

name_pattern = re.compile(r'name="([a-zA-Z]*)"')
type_pattern = re.compile(r'type="([0-9]*)"')
COMMAND_START = 10000000

#[2019-07-24 02:29:13.008] [glinkd-1] [info]              command type:10000302, count:64462463
def GenerateDefine(define_file, define_dict):
    for line in open(define_file).readlines():
        name_result = name_pattern.search(line)
        type_result = type_pattern.search(line)
        if name_result and type_result:
            define_dict[int(type_result.group(1))] = name_result.group(1)


if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage:./top.py rpcalls.py cmds.py directory")
        sys.exit(-1)

            
    proto_define = {}
    GenerateDefine(sys.argv[1], proto_define)
    cmd_define = {}
    GenerateDefine(sys.argv[2], cmd_define)

    pattern = re.compile(r'command type:([0-9]*), count:([0-9]*)')
    directory = sys.argv[3]

    total_dict = {}
    for root, dirs, files in os.walk(directory):
        print(root)
        print(dirs)
        for filename in files:
            f = open(os.path.join(root, filename))
            for line in f.readlines():
                search_result = pattern.search(line)
                #search_result = re.searth(r'command type:([0-9]*), count:([0-9]*)', line)
                if search_result:
                    print(search_result.group(), search_result.group(1), search_result.group(2))
                    key = int(search_result.group(1))
                    value = int(search_result.group(2))
                    #print(key,value)
                    accum_value = total_dict.get(key, 0) + value
                    total_dict[key] = accum_value
            f.close()

    total_array = sorted(total_dict.items(), key=lambda d:d[1], reverse = True)

    print('------------------总体排序-----------------------')
    for item in total_array:
        key = item[0] 
        proto_type = "protocol"
        is_cmd = False
        if key >= COMMAND_START:
            key -= COMMAND_START
            proto_type = "command"
            is_cmd = True
        print("{0}:{1}\t\tcount:{2}\t\t{3}".format(proto_type, key, item[1], cmd_define[key] if is_cmd else proto_define[key]))

    print('\n------------------protocol排序-------------------')

    for item in total_array:
        key = item[0]
        if key < COMMAND_START:
            print("protocol:{0}\t\tcount:{1}\t\t{2}".format(key, item[1], proto_define[key]))

    print('\n------------------command排序--------------------')
    for item in total_array:
        key = item[0]
        if key >= COMMAND_START:
            key -= COMMAND_START
            print("command:{0}\t\tcount:{1}\t\t{2}".format(key, item[1], cmd_define[key]))



