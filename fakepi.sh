#!/bin/bash 
# test fake pi 

echo -e "\e[32;40m Pi model...\e[0m"
cat /sys/firmware/devicetree/base/model 
echo ""

echo -e "\e[32;40m memtester is running... \e[0m"
memtester > /dev/null 2>&1 
sleep 5
sudo killall memtester 2>&1 > /dev/null
echo -e "\e[32;40m memtester is stopping... \e[0m"

echo -e "\e[32;40mFake Pi testing progress...\e[0m"
yes|ffmpeg -t 00:00:05 -i ./aaa.mp4 -vcodec h264_v4l2m2m -acodec copy bbb.mp4 > ffmpeg.log 2>&1

if [ -e ffmpeg.log ]; then

	speed=`cat ffmpeg.log | awk '{print $NF}' | grep speed | awk -F'=' '{print $2}' | cut -d'x' -f1 | awk -F'.' '{print $1}'` 

	echo $speed

   if [ $speed -gt 0 ]; then
	echo -e "\e[32;40mGPU is activate and working well.\e[0m"
	echo "REAL" |figlet 
	echo "This Pi is real" | cowsay
   else
	echo -e "\e[34;40mGPU is NOT working! CPU in heavy load! \e[0m"
	echo "FAKE" |figlet 
	echo "This Pi is fake" | cowsay
   fi
fi 
