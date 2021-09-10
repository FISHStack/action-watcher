#!/bin/bash
#Author:Cdy
#Date：2020-04-07
who=`whoami`
url="http://localhost:8081/ping/"$who
echo whoami
code=`curl -X GET -I -m 30 -o /dev/null -s -w %{http_code}"\n" $url`           #第一次访问,访问成功则不进入下面while循环
echo "访问时间是：`date '+%Y%m%d %H:%M:%S'`--$code--->$url"
while [ $code -ne 200 ]
do
  sleep 5s
  code=`curl -X GET -I -m 30 -o /dev/null -s -w %{http_code}"\n" $url`
  echo whoami
  echo "访问时间是：`date '+%Y%m%d %H:%M:%S'`--$code--->$url" 
done
#while循环访问url,直到状态码为200跳出循环
