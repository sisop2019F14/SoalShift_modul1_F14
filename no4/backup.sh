#!/bin/bash

time=`date '+%X'`
hour=${time:0:2}
jam=$hour
hour=`echo "$hour" | bc`

min=${time:3:2}
tanggal=`date | awk '{print $3}'`
bulan=`date | awk '{print $2}'`
tahun=`date | awk '{print $6}'`

#echo $time
#echo $jam $min $tanggal $bulan $tahun

cd /var/log
file=`cat syslog`
#echo $file
result=$file

cd /home/anwar/praktikum_1/no4
#cat /dev/null > yeay.txt

for ((i=0; i<${#file}; i++));
do
	ascii=${file:$i:1}
	ascii_value=$( printf "%d" "'${ascii}" )
	replace_index=$i
	replace_index=$((replace_index+1))
#	x=$( printf "\x$(printf %x $ascii_value)")
#	echo $x	

	if [ $ascii_value -gt 96 -a $ascii_value -lt 123 ]
	then
		newascii=$((ascii_value + hour))
		
		if [ $newascii -gt 122 ]
		then
			newascii=$((newascii-26))
			#echo $newascii
		fi

		newchar=$(printf "\x$(printf %x $newascii)")
		#echo $newchar
		

		result="$(echo $result | sed s/./$newchar/$replace_index)"
#		trash=
		echo -n "${result:$i:1}" #>> yeay.txt
		
	elif [ $ascii_value -gt 64 -a $ascii_value -lt 91 ]
	then

		newascii=$((ascii_value + hour))

                if [ $newascii -gt 90 ]
		then
                        newascii=$((newascii-26))
			#echo $newascii
                fi

                newchar=$(printf "\x$(printf %x $newascii)")
		result="$(echo $result | sed s/./$newchar/$replace_index)"
               # trash=
		echo -n "${result:$i:1}" #>> yeay.txt

	
	#fi
	else	

	#trash=
	echo -n "${result:$i:1}" #>> yeay.txt
	#cat yeay.txt
	#echo $result
	#echo "Waiting for encryption..."
	#echo $result > "$jam:$min $tanggal-$bulan-$tahun".txt
	fi
done

echo $result > "$jam:$min $tanggal-$bulan-$tahun".txt


