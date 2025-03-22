# Auto-Connect Script Guide for Charles Proxy

> 📘 *This is a recreated version of a technical guide originally written for internal use. All company-specific names and sensitive content have been removed or replaced for public sharing in a portfolio setting.*

---

How to connect charles automatically
This document will help you creating a script to connect automatically your stage Squid devices to charles proxy
Team: [Internal Team Name]
Author: ([Company] QA lead for T2)
Go-Link: 
Contributors: 
Last Updated: 19/12/2022

Open your terminal Command + Space Bar then type "Terminal" or just open it from Launchpad

Once your terminal is open probably you will see something like this: 

Note: Be sure to be in home/ directory. You can verify typing: pwd in your terminal and you will see something like this: 

Note2: If for some unknown reason you terminal open in a different directory just type 
cd ~ it will be redirected to home directory like this:



Once you're at home/ directory we need move to bin/ directory typing in our terminal this: cd bin/ and you will see something like this:


At bin/ directory we are going to create a file using this command: 
nano use\_as\_example.sh then hit enter, it will open something like this: 

Once you file is created an open in nano editor, please copy/paste this:

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

Note: Please be careful when copy/paste due spaces, etc, etc and replace your local ip (red ones)
Note: You can see your local ip open Charles Proxy click on Help 

Go back to your file and should be like this:

To save changes just use: ctrl + s then ctrl + x to close nano editor


To verify that everything is ok until now in your terminal type ls this command will show you the list of content inside in the directory

If everything looks similar like point 8 the script should be working fine you can verify typing bash use\_as\_example.sh

Note: be sure to run it while you’re at the directory bin/ 

Now we are able to run the script from bin/ directory which is not convenient because we must always be in the directory to be able to use it, so now we are going to make this script executable, this will help us to run it from every directory that we are located in.





Please run this command, chmod +x use\_as\_example.sh be sure to stay in the bin/ directory before run it otherwise it will appear an error message. After that once again type ls command and you'll see something like this: 

Note: You will notice that the strings file name actually change its color, so now our script is runnable from any directory that we want, just last thing. Restart the terminal or close and open it once again 

Once you re open the terminal just type use\_as\_example.sh and the script should be start running
 you can find a video of the expected behavior, 

Note: For X2 user be sure to do adb connect  before to run the script

Note 2: Please wait two or three seconds after plug in its device (T2) and connect adb ip for X2 before run your script
