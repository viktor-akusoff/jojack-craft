#!/bin/bash
cd ~
if [[ ! -f /root/eula.txt || $(cat /root/eula.txt) == *"eula=false"* ]]; then
	echo 'FIRST LAUNCH OF JOJACK-CRAFT'
	java -jar /root/paper.jar
	echo 'eula=true' > /root/eula.txt
fi

java -jar /root/paper.jar
