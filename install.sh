#!/bin/bash



parser() {
    # Define default values
    user=${user:-"cpage"}
    server=${server:-"devged-alfresco.cpage.fr"}
    fixport=${fixport:-"false"}

    # Assign the values given by the user
    while [ $# -gt 0 ]; do
        if [[ $1 == *"--"* ]]; then
            param="${1/--/}"
            declare -g $param="$2"
        fi
        shift
    done

}

parser $@

echo "user:" $user
echo "server:" $server
echo "fixport:" $fixport

if [ $fixport = "true" ]
then
  echo "Fixing port config"
  sed -i 's/"ecmHost": "{protocol}\/\/{hostname}{:port}"/"ecmHost": "{protocol}\/\/{hostname}"/g' app.config.json
fi
