#!/bin/sh
#This script is for ss-redir restart and switch accounts.
CRISSIC='/jffs/config/config_crissic.json'
BANDWAGON='/jffs/config/config_redir.json'
SS_ACCOUNT=""
case $1 in 
        "crissic")
         SS_ACCOUNT=$CRISSIC
        echo $SS_ACCOUNT
        ;;
        "bandwagon")
         SS_ACCOUNT=$BANDWAGON
        echo $SS_ACCOUNT
        ;;
        *)
        echo "wrong or missing parameter"
        ;;
esac
#echo $1|while read line;do 
#echo "$line"
#done
for b in `ps |grep ss-redir|grep -v grep|awk '{print $1}'`;do kill $b;done
nohup /jffs/shadowsocks/ss-redir -c $SS_ACCOUNT 1>/dev/null 2>&1 & 
