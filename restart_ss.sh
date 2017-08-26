#!/bin/sh
#This script is for ss-redir restart and switch accounts.
PIDS='/jffs/config/config_pids.json'
BWG='/jffs/config/config_bwg.json'
ALPHA_T='/jffs/config/config_alpha_tunnel.json'
FREE='/jffs/config/free.json'
PRESS='/jffs/config/press.json'
SS_ACCOUNT=""
SS_T_ACCOUNT=""
case $1 in
        "pids")
         SS_ACCOUNT=$PIDS
         SS_T_ACCOUNT=$BANDWAGON_T
        echo $SS_ACCOUNT
        ;;
        "bwg")
        SS_ACCOUNT=$BWG
        SS_T_ACCOUNT=$BWG
        echo $SS_ACCOUNT
        ;;
        "free")
        SS_ACCOUNT=$FREE
        echo $FREE
        ;;
        "press")
        SS_ACCOUNT=$PRESS
        echo $PRESS
        ;;
        *)
        echo "wrong or missing parameter"
        ;;
esac
#echo $1|while read line;do
#echo "$line"
#done
for b in `ps |grep ss-redir|grep -v grep|awk '{print $1}'`;do kill $b;done
nohup /jffs/opt/bin/ss-redir -c $SS_ACCOUNT -b 0.0.0.0 1>/dev/null 2>&1 &
#for a in `ps |grep ss-tunnel|grep -v grep|awk '{print $1}'`;do kill $a;done
#nohup /jffs/shadowsocks/ss-tunnel -c $SS_T_ACCOUNT -L 8.8.8.8:53 -u >/dev/null 2>&1 &