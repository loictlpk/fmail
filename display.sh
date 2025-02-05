#!/bin/bash

source ./source/variables

case $choice in
	quarantine | -q)
		quarantine_list=$((for folder in FortiGuard-Antispam ; do
					curl -s -k --cookie $cookie "https://$domain/api/v1/QuarantineMailDisplay?startindex=0&pageSize=500&type=system&folder=$folder" | jq '.collection | .[] | .env_from' | tr -d ['"']
				done) | cut -d"@" -f2 | sort -hr)

		if [[ "$3" == "-c" ]] || [[ "$3" == "--count" ]] || [[ "$3" == "count" ]] ; then
			echo "$quarantine_list" | uniq -c | sort -hr
		else
			echo "$quarantine_list"
		fi
	;;


	blocklist | -b)
		curl -s --cookie $cookie -H "Content-Type: application/json" -X POST -d '{"reqAction":"1","extraParam":"blocklist"}' https://$domain/api/v1/SenderListV2/system/ | jq -r '.listitems | split(",")[] | ltrimstr("*")'
	;;

	safelist | -s)
		curl -s --cookie $cookie -H "Content-Type: application/json" -X POST -d ' {"reqAction":"1","extraParam":"safelist"}' https://$domain/api/v1/SenderListV2/system/ | jq -r '.listitems | split(",")[] | ltrimstr("*")'
	;;

	global | -g)
		curl -s --cookie $cookie -H "Content-Type: application/json" -X GET https://$domain/api/v1/SysGlobal | jq
	;;

	*)
		echo "make choice"
	;;

esac

