awk -F, '
{
	if($4 == "Personal Accessories"){
	a[$6]+=$10;
	}

	if($4 == "Camping Equipment"){
	b[$6]+=$10;
	}

	if($4 == "Outdoor Protection"){
	c[$6]+=$10;
	}

	
}

END{
	p1=0;
	p2=0;
	p3=0;
	
	for(key in a){
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


	p4=0;
	p5=0;
	p6=0;
	
	for(key in b){
		if(p4 < b[key]){
			p4=b[key]
			idx4=key
			
		}
	}

	for(key in b){
		if(p5 < b[key] && key != idx4 ){
			p5=b[key]
			idx5=key
			
		}
	}

	for(key in b){
		if(p6 < b[key] && key != idx4 && key!=idx5){
			p6=b[key]
			idx6=key
			
		}
	}

	print "1:",idx4",","2:",idx5,",","3:"idx6

	
	p7=0;
	p8=0;
	p9=0;
	
	for(key in c){
		if(p7 < c[key]){
			p7=c[key]
			idx7=key
			
		}
	}

	for(key in c){
		if(p8 < c[key] && key != idx7 ){
			p8=c[key]
			idx8=key
			
		}
	}

	for(key in c){
		if(p9 < c[key] && key != idx8 && key!=idx7){
			p9=c[key]
			idx9=key
			
		}
	}

	print "1:",idx7",","2:",idx8,",","3:"idx9


}' WA_Sales_Products_2012-14.csv
