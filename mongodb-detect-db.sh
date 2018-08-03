#!/bin/bash
๊USER=""
PASSWD=""
DBNAME=""
MONGO_DB="$(mongo $DBNAME --quiet --eval "db.getCollectionNames().toString().replace(/,/g, ' ')" --port 27017 -u "$USER" -p "$PASSWD" --host  127.0.0.1  --authenticationDatabase "admin")"
#echo $MONGO_DB

FIRST_ELEMENT=1
function check_first_element {
    if [[ $FIRST_ELEMENT -ne 1 ]]; then
        printf ","
    fi
    FIRST_ELEMENT=0
}
printf '{'
printf ' "data":['
for TABLES in $MONGO_DB; do
    #echo $db
    check_first_element
        printf "{"
        printf "\"{#TABLES}\":\"$TABLES\""
        printf "}"
done
printf ' ]'
printf '}'
