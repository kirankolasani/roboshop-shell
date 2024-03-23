#!/bin/bash

#disk_usage=$(df -hT|grep -vE 'tmpfs|Filesystem'|awk '{print $6}'|cut -d % -f1)
disk_usage=$(df -hT|grep -vE 'xfs|Filesystem')
echo "disk_usage : $disk_usage"
disk_threashold=1
if [ $($disk_usage|awk '{print $6}'|cut -d % -f1) -ge $disk_threashold]
then 