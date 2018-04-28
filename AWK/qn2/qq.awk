#!/usr/bin/gawk
{
	array[$3" "$5]++;
	
	if($NF!=0){
		datPacket[$3" "$5]++;
		
		binaryBits[$3" "$5]=binaryBits[$3" "$5]+$NF
		
		}		
}
	
	
END{
	for (variable in array){
	if(datPacket[variable]<1){
		datPacket[variable]=0;
		binaryBits[variable]=0;}
	
	
	
	print "connection("variable")"
	
	print  "#packets="array[variable],"#datapackets="datPacket[variable],"#bytes="binaryBits[variable]
	
	
	
}}
