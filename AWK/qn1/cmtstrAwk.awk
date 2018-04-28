#!/usr/bin/gawk
BEGIN{
           doubleSlash=0 
           flag=-1#flag variable for comments
           #flag = -1 imply we have not found double slash or slash star 
	   #flag = 0 slash star found 
	   slashStar=0
	   strag=-1 #flag variable for string
	   #string=0 imply string is found
	   string=0
}
     
{    
	if($0~/\/\*/){
	flag=0;
	}

	if(flag==0){
	slashStar++;
	#if " or // found do nothing. They will be just treated as comments
	}



	
#Number of comments

        if(flag!=0 && flag==-1 && $0~/\/\// ){
        	doubleSlash++;
		flag=1;#double slash found for first time
	}

        if($0~/\*\//){
        flag=-1;
	}
#number of strings
	if( ($0~/\"/ && flag!=0 && flag!=1) || $0~/\(\"/ || $0~/\= \"/ || $0~/\( \"/ || $0~/\=\"/ || $0~/\(  \"/ || $0~/\=  \"/ ){
	strag=0; #first double quote found outside of comments
	}

	if( strag==0 && $0~/\"/  ){
	string++;
		if($0~/\/\*/ || $0~/\/\//){
		flag=-1;
		slashStar--;
		}
		if($0~/\;\/\*/ ||  $0~/\;\/\// ||  $0~/\; \/\// ||  $0~/\; \/\*/ ||  $0~/\;  \/\// ||  $0~/\;  \/\*/ ){
		flag=0;
		slashStar++;
		}
		if($0~/(\*\/)$/ ||  $0~/\;\/\//  ||  $0~/\; \/\// ||  $0~/\;  \/\//){
		flag=-1
		}
	strag=-1;
	}

	if(flag==1){ flag=-1; }
}    



END{
	comments=doubleSlash+slashStar
	print comments
        print string
}
