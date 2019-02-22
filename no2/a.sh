awk -F, '
{
	if($7 == "2012"){
	a[$1]+=$10;
	}
}

END{
	max=0;
	for(key in a){
		print key, a[key];
		if(max < a[key]){
			max=a[key]
			idx=key
		}
	}
	print "Yang terbanyak adalah"
	print idx

}' WA_Sales_Products_2012-14.csv
