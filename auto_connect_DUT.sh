#!/bin/bash

adb root
sleep 2
adb shell settings put global global\_http\_proxy\_host 
sleep 2
adb shell settings put global global\_http\_proxy\_port 8888
sleep 2
adb shell stop
echo "Wait..."
adb shell start
sleep 5
echo "Setting..."
#####################################################################
adb shell iptables -F
adb shell iptables -P INPUT ACCEPT
adb shell iptables -P OUTPUT ACCEPT
echo "Success!!!"
