#!/bin/bash

#mencari jam berapa sekarang
time=`date "+%X" | awk -F: '{print $1}'`

#mengambil jamnya saja
#time=${time:0:2}

#mengcounter 09
time=`echo "$time" | bc`

#menentukan jam menit tanggal untuk menamai file
jam=`date "+%X" | awk -F: '{print $1}'`

menit=`date "+%X" | awk -F: '{print $2}'`

tanggal=`date | awk '{print $3}'`

bulan=`date | awk '{print $2}'`

tahun=`date | awk '{print $6}'`

#menentukan batas bawah
bawahb=$(($time+65))

#menjadikan ascci value menjadi char
bawahb=$(printf \\$(printf '%03o' $bawahb))

#menentukan batas atas
atasb=$(printf '%d' "'$bawahb")
atasb=$(($atasb-1))

    if [ $atasb -lt 65 ]
    then
        atasb=90
    fi

#menjadikan ascci value menjadi char
atasb=$(printf \\$(printf '%03o' $atasb))

#menentukan batas bawah
bawahk=$(($time+97))

#menjadikan ascci value menjadi char
bawahk=$(printf \\$(printf '%03o' $bawahk))

#menentukan batas atas
atask=$(printf '%d' "'$bawahk")
atask=$(($atask-1))

    if [ $atask -lt 97 ]
    then
        atask=122
    fi

#menjadikan ascci value menjadi char
atask=$(printf \\$(printf '%03o' $atask))

#masuk k folder
cd /home/anwar/praktikum_1/no4

#buat
cat /var/log/syslog | tr [a-z] ["$bawahk"-za-"$atask"] | tr [A-Z] ["$bawahb"-ZA-"$atasb"] > "$jam:$menit $tanggal-$bulan-$tahun".txt

