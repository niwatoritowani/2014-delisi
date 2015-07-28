BEGIN {
    print "This file is excuted by"
    print "\"awk -f awk1.awk caselist_jun.txt\""
}
NR == 1 {
    print "Fields in this file are"
    print $0
}



## All records have data in their 1st and 2nd fields. 
## The records have either Yes or nothing in their 3rd fields. 
## If the record has Yes, it will not be changed,  
## and If the record han nothing, 3rd field is filled with NA, 
## to fill something all fields. 

#BEGIN {
#	outputfile = "caselist_jun.txt"
#}
#NR == 1 {
#	print $0 > outputfile
#}
#NR >1 {
#	if ($3 == "Yes") {
#		print $0 > outputfile
#	} else {
#		print $0 " NA" > outputfile
#	}
#}


## Add new field (originally there is 3 fields in it.) 

#BEGIN {
#	outputfile = "caselist_jun.txt"
#}
#{
#	printf("%-20s %-10s %-10s %-10s %-10s \n", $1, $2, $3, "NA", "NA") > outputfile
#}


## Add new field (originally there is 5 fields in it.) 

#BEGIN {
#	outputfile = "caselist_jun.txt"
#}
#{
#	printf("%-20s %-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5, "NA") > outputfile
#}

