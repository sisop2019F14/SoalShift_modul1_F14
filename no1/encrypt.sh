#!/bin/bash

cd /home/anwar/praktikum_1/no1
unzip nature.zip
cd nature/

name="extracted"


for i in *.jpg;
do
	#echo $i
	newfile="$name$i"
	base64 -d $i | xxd -r > $newfile	
done
