#!/bin/bash

#menentukan jam menit tanggal untuk menamai file
jam=`echo $1 | awk -F: '{print $1}'`

menit=`echo $1 | awk '{print $1}' | awk -F: '{print $2}'`

tanggal=`echo $1 | awk '{print $2}' | awk -F- '{print $1}'`

bulan=`echo $1 | awk '{print $2}' | awk -F- '{print $2}'`

tahun=`echo $1 | awk '{print $2}' | awk -F- '{print $3}' | awk -F. '{print $1}'`

#mencari jam berapa sebelumnya diencrypt dr nama filenya
time=`echo $1 | awk -F: '{print $1}'`

#mengcounter 09
time=`echo "$time" | bc`

#biar ketemu variable yg terencryption menjadi a
time=$(($time-1))

#menentukan batas bawah huruf besar
bawahb=$((90-$time))

    if [ $bawahb -gt 90 ]
    then
        bawahb=65
    fi

#menjadikan ascci value menjadi char
bawahb=$(printf "\x$(printf %x $bawahb)")

#menjadikan char menjadi ascii value
atasb=$(printf '%d' "'$bawahb")

#menentukan batas atas huruf besar
atasb=$(($atasb-1))

    if [ $atasb -lt 65 ]
    then
        atasb=90
    fi

#menjadikan ascci value menjadi char
atasb=$(printf "\x$(printf %x $atasb)")

#menentukan batas bawah huruf kecil
bawahk=$((122-$time))

    if [ $bawahk -gt 122 ]
    then
        bawahk=97
    fi

#menjadikan ascci value menjadi char
bawahk=$(printf "\x$(printf %x $bawahk)")

#menjadikan char menjadi ascii value
atask=$(printf '%d' "'$bawahk")

#menentukan batas atas huruf kecil
atask=$(($atask-1))

    if [ $atask -lt 97 ]
    then
        atask=122
    fi

#menjadikan ascci value menjadi char
atask=$(printf "\x$(printf %x $atask)")

#and tinggal di shift dan save
cat "$jam:$menit $tanggal-$bulan-$tahun".txt | tr [a-z] ["$bawahk"-za-"$atask"] | tr [A-Z] ["$bawahb"-ZA-"$atasb"] > "$jam:$menit $tanggal-$bulan-$tahun-decrypted".txt
