#!/bin/bash

figlet -f standard "Covid 19 Tracker" | lolcat -d 50

NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
BLINK='\033[5m'
UNDERLINE='\033[4m'

echo -e "${CYAN}${BOLD}~ Who Killed DB ?${NONE}${NONE}"
echo '' 

if [ $# -ne 1 ]; then
	

	#For coverting only first Character into uppercase use ${country^}"
	echo -e "${WHITE}Presenting The Statistics for World Wide COVID19 Cases${NONE} :"
	echo ""
	curl -sS "https://www.worldometers.info/coronavirus/" > output.txt

	function check_errors(){
		[ $? -ne 0 ] && echo "Error Fetching Webpage." && exit -1
		
	}
	check_errors
	total_cases=$(cat output.txt | grep '<span style="color:#aaa">' | sed "s/<[^>]*>//g")

	temp=$(cat output.txt | grep '<span>' | sed "s/<[^>]*>//g")
	echo $temp | tr ' ' '\n'> results.txt
	echo -e "Total Number Of Cases So Far  : ${RED}$total_cases${NONE}"
	deaths=$(awk 'NR == 1 {print $1}' results.txt)
	echo -e "Deaths : ${RED}$deaths${NONE}"
	recovered=$(awk 'NR == 2 {print $1}' results.txt)
	echo -e "Total Recovered : ${YELLOW}$recovered${NONE}"

	true > results.txt

	cat output.txt| grep '<li class="news_li"><strong>' | sed "s/<[^>]*>//g" | sed "s/&.*//"  > results.txt

	echo ''
	

	echo ""

	DD=$(date +%d)
	MM=$(date +%m)
	YY=$(date +%y)
	
	echo -e "${PURPLE}Some Global Highlights As For $DD/$MM/$YY :${NONE}"

	echo ""
	cat results.txt | sed -n '1p'
	cat results.txt | sed -n '2p'
	cat results.txt | sed -n '3p'
	cat results.txt | sed -n '4p'
	cat results.txt | sed -n '6p'
	cat results.txt | sed -n '7p'
	echo ""
	
	echo -e "${RED}${BOLD}To Get Country-Wise Information Use : $(basename $0) Country Name${NONE}${NONE}"

	echo ""
	source="www.worldometers.info"
	echo -e "${PURPLE}Source : $source${NONE}"
	rm results.txt
	rm output.txt
		
	exit -1	
	
fi

country=$(echo $1)
country=${country,,}
#For coverting only first Character into uppercase use ${country^}"

curl -sS "https://www.worldometers.info/coronavirus/country/$country" > output.txt

function check_errors(){
	[ $? -ne 0 ] && echo "Error Fetching Webpage." && exit -1
	
}

check_errors
country=$(echo $1 | tr '-' ' ')
echo -e "${WHITE}Presenting The Statistics for : ${country^^}${NONE}"
echo ""
total_cases=$(cat output.txt | grep '<span style="color:#aaa">' | sed "s/<[^>]*>//g")
country=$(echo $1 | tr '-' ' ')
temp=$(cat output.txt | grep '<span>' | sed "s/<[^>]*>//g")
echo $temp | tr ' ' '\n'> results.txt
echo -e "Total Number Of Cases So Far  : ${RED}$total_cases${NONE}"
deaths=$(awk 'NR == 1 {print $1}' results.txt)
echo -e "Deaths : ${RED}$deaths${NONE}"
recovered=$(awk 'NR == 2 {print $1}' results.txt)
echo -e "Total Recovered : ${YELLOW}$recovered${NONE}"

true > results.txt

cat output.txt| grep '<li class="news_li"><strong>' | sed "s/<[^>]*>//g" | sed "s/&.*//"  > results.txt

echo ''
echo -e "${RED}This Week's Report : ${NONE}"

echo ""

DD=$(date +%d)
MM=$(date +%m)
YY=$(date +%y)
echo "$DD/$MM/$YY : $(cat results.txt | sed -n '1p') "


DD=$(date --date="yesterday" +%d)
MM=$(date --date="yesterday" +%m)
YY=$(date --date="yesterday" +%y)
echo "$DD/$MM/$YY : $(cat results.txt | sed -n '2p') "


DD=$(date --date="2 day ago" +%d)
MM=$(date --date="2 day ago" +%m)
YY=$(date --date="2 day ago" +%y)
echo "$DD/$MM/$YY : $(cat results.txt | sed -n '3p') "

DD=$(date --date="3 day ago" +%d)
MM=$(date --date="3 day ago" +%m)
YY=$(date --date="3 day ago" +%y)
echo "$DD/$MM/$YY : $(cat results.txt | sed -n '4p') "


DD=$(date --date="4 day ago" +%d)
MM=$(date --date="4 day ago" +%m)
YY=$(date --date="4 day ago" +%y)
echo "$DD/$MM/$YY : $(cat results.txt | sed -n '5p') "

DD=$(date --date="5 day ago" +%d)
MM=$(date --date="5 day ago" +%m)
YY=$(date --date="5 day ago" +%y)
echo "$DD/$MM/$YY : $(cat results.txt | sed -n '6p') "


DD=$(date --date="6 day ago" +%d)
MM=$(date --date="6 day ago" +%m)
YY=$(date --date="6 day ago" +%y)
echo "$DD/$MM/$YY : $(cat results.txt | sed -n '7p')"
echo ""
source="www.worldometers.info"
echo -e "${PURPLE}Source : $source${NONE}"
echo -e "${CYAN}Follow ${BOLD}@whokilleddb${NONE}${NONE}"
echo -e "${BLINK}${BOLD}${RED}STAY${NONE} ${BLINK}${BOLD}${PURPLE}HOME${NONE} ${BLINK}${BOLD}${YELLOW}STAY${NONE} ${BLINK}${BOLD}${WHITE}SAFE${NONE}"
rm results.txt
rm output.txt
