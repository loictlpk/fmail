#!/bin/bash

source ./source/variables

dom=${arg}
comment=${arg2}
user=${arg3}


case $action in

    --add-system )
        if [[ ! -z "$dom" ]]; then
            if [[ "$choice" == "-b" ]] || [[ "$choice" == "--blocklist" ]] || [[ "$choice" == "blocklist" ]] ; then
                curl -s -k --cookie $cookie -H "Content-Type: application/json" -X POST -d "{\"reqAction\":\"2\", \"extraParam\":\"blocklist\", \"listitems\":\"${dom}:${comment}\"}" https://$domain/api/v1/SenderListV2/system/ && echo
            elif [[ "$choice" == "-s" ]] || [[ "$choice" == "--safelist" ]] || [[ "$choice" == "safelist" ]] ; then
                curl -s -k --cookie $cookie -H "Content-Type: application/json" -X POST -d "{\"reqAction\":\"2\", \"extraParam\":\"safelist\", \"listitems\":\"${dom}:${comment}\"}" https://$domain/api/v1/SenderListV2/system/ && echo
            fi
        else
            echo "DOMAIN missing : $ fmail $action <choice> <dom> [comment]"
        fi
    ;;

    --remove-system )
        if [[ ! -z "$dom" ]]; then
            if [[ "$choice" == "-b" ]] || [[ "$choice" == "--blocklist" ]] || [[ "$choice" == "blocklist" ]] ; then
                curl -s -k --cookie $cookie -H "Content-Type: application/json" -X POST -d "{\"reqAction\":\"3\", \"extraParam\":\"blocklist\", \"listitems\":\"${dom}\"}" https://$domain/api/v1/SenderListV2/system/ && echo
            elif [[ "$choice" == "-s" ]] || [[ "$choice" == "--safelist" ]] || [[ "$choice" == "safelist" ]] ; then
                curl -s -k --cookie $cookie -H "Content-Type: application/json" -X POST -d "{\"reqAction\":\"3\", \"extraParam\":\"safelist\", \"listitems\":\"${dom}\"}" https://$domain/api/v1/SenderListV2/system/ && echo
            fi
        else
                echo "DOMAIN missing : $ fmail $action <choice> <dom> [comment]"
        fi
    ;;

    --add-personal )
    # CONDITION TO GET DOMAIN IF NO COMMENT NEXT TO DOMAIN ADRESS.
        if [[ $# -lt 5 ]]; then
            user=${comment}
            comment=""
        fi

        if [[ ! -z "$dom" ]]; then
            if [[ "$choice" == "-b" ]] || [[ "$choice" == "--blocklist" ]] || [[ "$choice" == "blocklist" ]] ; then
                curl -s -k --cookie $cookie -H "Content-Type: application/json" -X POST -d "{\"reqAction\":\"2\", \"extraParam\":\"blocklist\", \"listitems\":\"${dom}:${comment}\"}" https://$domain/api/v1/SenderListV2/$user/ && echo
            elif [[ "$choice" == "-s" ]] || [[ "$choice" == "--safelist" ]] || [[ "$choice" == "safelist" ]] ; then
                curl -s -k --cookie $cookie -H "Content-Type: application/json" -X POST -d "{\"reqAction\":\"2\", \"extraParam\":\"safelist\", \"listitems\":\"${dom}:${comment}\"}" https://$domain/api/v1/SenderListV2/$user/ && echo
            fi
        else
            echo "DOMAIN missing : $ fmail $action <choice> <dom> [comment] <user_mail>"
        fi
    ;;

    --remove-personal )
    # CONDITION TO GET DOMAIN IF NO COMMENT NEXT TO DOMAIN ADRESS.
        if [[ $# -lt 5 ]]; then
            user=${comment}
            comment=""
        fi

        if [[ ! -z "$dom" ]]; then
            if [[ "$choice" == "-b" ]] || [[ "$choice" == "--blocklist" ]] || [[ "$choice" == "blocklist" ]] ; then
                curl -s -k --cookie $cookie -H "Content-Type: application/json" -X POST -d "{\"reqAction\":\"3\", \"extraParam\":\"blocklist\", \"listitems\":\"${dom}\"}" https://$domain/api/v1/SenderListV2/$user/ && echo
            elif [[ "$choice" == "-s" ]] || [[ "$choice" == "--safelist" ]] || [[ "$choice" == "safelist" ]] ; then
                curl -s -k --cookie $cookie -H "Content-Type: application/json" -X POST -d "{\"reqAction\":\"3\", \"extraParam\":\"safelist\", \"listitems\":\"${dom}\"}" https://$domain/api/v1/SenderListV2/$user/ && echo
            fi
        else
            echo "DOMAIN missing : $ fmail $action <choice> <dom> [comment] <user_mail>"
        fi
    ;;

esac