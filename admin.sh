#!/bin/bash
# last update : 12/05/2019
# las  update : 28/11/2023
clear;clear
GREEN=$(tput setaf 2) #HIJAU
WHITE=$(tput setaf 7) #PUTIH
CYAN=$(tput setaf 6)
RED=$(tput setaf 1) #MERAH
NORMAL=$(tput sgr0)
curl ifconfig.me > /dev/null 2>&1 || { echo >&2  "check koneksi internet"; exit ; }
function banner(){
printf "${RED}
\t[ c0der by widhisec       ]
\t[ admin finder with bash  ]
"
}
function scanlgsg(){
         fc=$(command lynx -head -dump "$urls/$x" | grep -n "1" | cut -d "8" -f1 | cut -d "6" -f3 | cut -d "9" -f6 | cut -d "5" -f1 | tr -d "4" | grep --text "1:.*" | gawk '/:/{print $2}')
         printf "%sSTATUS : %s => %s/%s \n" "${GREEN}" "${fc}" "${urls}" "${x}"
}
hitung=15
printf ""
banner
echo -e -n $CYAN'[*]'$WHITE"URL HERE :" 
read urls
(
for x in $(cat wordlist.txt);do 
    ((i=i%hitung)); ((i++==0)) && wait
    scanlgsg $x $urls $lisz $fc
done
wait
)
