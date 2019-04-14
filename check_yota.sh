#!/bin/sh
# https://www.linux.org.ru/forum/general/11401301

# check header:
# curl -s -I ya.ru
# or
# curl -A "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0" -s -I ya.ru | grep -Ec 'http://hello.yota.ru'


edate=`date`
checkhost=http://ya.ru
useragaent="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0"
#COMMANDACCESS="accept_lte=1&redirurl=$checkhost&city=nsk&connection_type=light&service_id=Sliders_Free_Temp"
COMMANDACCESS="redirurl=$checkhost&city=nsk&connection_type=light&service_id=Sliders_Free_Temp"
CHECK="/usr/bin/curl -A "\"$useragaent\"""
#CHECK="/usr/bin/wget -U \"$useragaent\""

COMMANDCHECK="$CHECK -s -I $checkhost"
#COMMANDCHECK="$CHECK -S --spider $checkhost"

SCRIPTRUN="$CHECK --data \"$COMMANDACCESS\" http://hello.yota.ru/php/go.php"
#SCRIPTRUN='$CHECK --post-data \"$COMMANDACCESS\" http://hello.yota.ru/php/go.php"

#if [ $($COMMANDCHECK | grep -Ec 'HTTP/1\.1 301|HTTP/1\.1 302') -gt 0 ];
if [ $($COMMANDCHECK | grep -Ec 'http://hello.yota.ru') -gt 0 ];
then
#echo "----- Check start "$edate" -----";
eval "$SCRIPTRUN"
#echo "----- Check end "$edate" -----\n";
fi
