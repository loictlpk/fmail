#!/bin/bash

source ./source/variables

if grep "0" $log_auth > /dev/null & test -f $cookie; then

	case $action in
		connect | "-c" )
			bash connect.sh
		;;

		display | "-d" )
			# arg = quarantine, blocklist, safelist, global, etc.	| arg = additional flag : -c, etc.
			bash display.sh $choice $arg $add_flag
		;;

		--add-system )
			bash manage.sh $action $choice $arg $arg2 
		;;

		--remove-system )
			bash manage.sh $action $choice $arg $arg2 
		;;

		--add-personal )
			bash manage.sh $action $choice $arg $arg2 $arg3
		;;

		--remove-personal )
			bash manage.sh $action $choice $arg $arg2 $arg3
		;;

		* | -h | --help )
			cat $doc
		;;
	esac

else
	echo -e "NOT CONNECTED. LET'S CONNECT\n" && bash connect.sh
fi
