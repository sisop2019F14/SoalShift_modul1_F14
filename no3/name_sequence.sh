#!/bin/bash

for ext in password*.txt
do
        count=$((count+1))
done
#echo $count


flag=0
for ((i=1; i<=count; i++))
do
    for ext in password*.txt
    do
        my_string="$ext"
        substring="password$i"
	#echo $my_string
	#echo $substring
        if [ "${my_string/$substring}" = "$my_string" ]
            then
                   # echo "tidak ada"
                    flag=0

            else
                   # echo "ada"
                    flag=1
                    break
	    fi
    done
  
 #   echo $flag

    if [ $flag -eq 0 ]
        then
	
        namafile="password$i.txt"
        head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12 > "$namafile"

	#echo "make password $namafile"
        exit
    fi

done



