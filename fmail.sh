#!/bin/bash

source ./source/variables

if grep "0" $log_auth > /dev/null & test -f $cookie; then

	case $action in
		connect | "-c" )
			bash connect.sh
		;;

		display | "-d" )
			bash display.sh $@
		;;

		--add-system )
			bash manage.sh $@
		;;

		--remove-system )
			bash manage.sh $@
		;;

		--add-personal )
			bash manage.sh $@
		;;

		--remove-personal )
			bash manage.sh $@
		;;

		* | -h | --help )
			cat $doc
		;;
	esac

else
	echo -e "NOT CONNECTED. LET'S CONNECT\n" && bash connect.sh
fi
