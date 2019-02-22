#read country
#echo $country
awk -F, '
{
	if($1 == "United States" && $7 == "2012"){
#	if(/$country/){
#	if(/2012/){
#		print "tes";
		a[$4]+=$10;
#		}
	}
}

END{
	p1=0;
	p2=0;
	p3=0;
	
	for(key in a){
		print key,a[key];
		if(p1 < a[key]){
			p1=a[key]
			idx1=key
		}
	}

	for(key in a){
		if(p2 < a[key] && key != idx1 ){
			p2=a[key]
			idx2=key
		}
	}

	for(key in a){
		if(p3 < a[key] && key != idx1 && key!=idx2){
			p3=a[key]
			idx3=key		
		}
	}

	print "1:",idx1",","2:",idx2,",","3:"idx3

}' WA_Sales_Products_2012-14.csv
