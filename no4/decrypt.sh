#!/bin/bash

echo $1
hour=`echo $1 | awk -F: '{print $1}'`

hour=`echo "$hour" | bc`

jam=`echo $1 | awk -F: '{print $1}'`
min=`echo $1 | awk '{print $1}' | awk -F: '{print $2}'`
tanggal=`echo $1 | awk '{print $2}' | awk -F- '{print $1}'`
bulan=`echo $1 | awk '{print $2}' | awk -F- '{print $2}'`
tahun=`echo $1 | awk '{print $2}' | awk -F- '{print $3}' | awk -F. '{print $1}'`

#echo $time
echo $jam $min $tanggal $bulan $tahun

#cd /var/log
file=`cat "$jam:$min $tanggal-$bulan-$tahun".txt`
echo $file
length=${#file}
echo $length
result=$file

cd /home/anwar/praktikum_1/no4
#cat /dev/null > yeay.txt

for ((i=0; i<$length; i++))
do
	ascii=${file:$i:1}
	ascii_value=$( printf "%d" "'${ascii}" )
	replace_index=$i
	replace_index=$((replace_index+1))
#	x=$( printf "\x$(printf %x $ascii_value)")
#	echo $x	

	if [ $ascii_value -gt 96 -a $ascii_value -lt 123 ]
	then
		newascii=$((ascii_value - hour))
		
		if [ $newascii -lt 97 ]
		then
			newascii=$((newascii+26))
			#echo $newascii
		fi

		newchar=$(printf "\x$(printf %x $newascii)")
		#echo $newchar
		

		result="$(echo $result | sed s/./$newchar/$replace_index)"
#		trash=
		echo -n "${result:$i:1}" #>> yeay.txt
		
	elif [ $ascii_value -gt 64 -a $ascii_value -lt 91 ]
	then

		newascii=$((ascii_value - hour))

            if [ $newascii -lt 65 ]
		    then
                newascii=$((newascii+26))
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
	#echo $result > "$jam:$min $tanggal-$bulan-$tahun.txt"
	fi
done

echo $result > "$jam:$min $tanggal-$bulan-$tahun-decrypted".txt


