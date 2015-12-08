#!/bin/sh
#restart_dnsmasq.sh 
#This script is for restart customized dnsmasq in ddwrt, you have to rename dnsmasq to other name like 'mydnsmasq',otherwise ddwrt process monitor would kill it and execute its default one.
#for a in `ps |grep dnsmasq|grep -v grep|awk '{print $1}'`;do echo $a;done
#Find out previous dnsmasq pid and kill it,then execute your own dnsmasq. 
for a in `ps |grep dnsmasq|grep -v grep|awk '{print $1}'`;do kill -9 $a;done
/jffs/scripts/mydnsmasq -u root -g root --conf-file=/jffs/config/dnsmasq.conf
