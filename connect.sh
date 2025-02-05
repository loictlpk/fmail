#!/bin/bash

# DEPS
# sudo apt install -y jq  # JSON OUTPUT BEAUTIFIER

source ./source/variables

#VARS
user=""
password=""

# CODE
#Login
read -p "Utilisateur : " user
read -s -p "Mot de passe : " password

#FUNCS
connect() {
	echo "CONNECTION : " >> $logs_e || (mkdir $logs_e && echo "CONNECTION : " >> $logs_e)
	http_code=$(curl -v -c $cookie -s -o /dev/null -w "%{http_code}" -k -H "Content-Type: application/json" -X POST -d "{\"name\":\"${user}\",\"password\":\"${password}\"}" https://${domain}/api/v1/AdminLogin | jq) >> $logs_e

    if [[ "$http_code" -ge 200 && "$http_code" -lt 300 ]]; then
        echo "OK" >> $logs_e
	return 0 # Succès
    else
        return 1 # Échec
    fi
}

main(){
	echo $1 > $log_auth
}

#MAIN ENTRYPOINT : Verif de la connection pour utilisation
if connect; then
	clear && echo -e "\nCONNECTE\n"
	main '0'
else
	clear && echo -e "\nCONNECTION ECHOUEE : Réessayez.\n"
	main '1'
fi



