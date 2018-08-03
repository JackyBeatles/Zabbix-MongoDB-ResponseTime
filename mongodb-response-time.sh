#!/bin/bash
DBNAME=""
TABLES=$1
OPTION=$2
USER=""
PASSWD=""
case $OPTION in
        total)
                QUERY="$(mongotop  --rowcount 1 --quiet --json   --port 27017 -u "$USER" -p "$PASSWD" --host  127.0.0.1  --authenticationDatabase "admin" | jq '.totals["'$DBNAME'.'$TABLES'"] .total .time')"
                ;;
        read)
                  QUERY="$(mongotop  --rowcount 1 --quiet --json   --port 27017 -u "$USER" -p "$PASSWD" --host  127.0.0.1  --authenticationDatabase "admin" | jq '.totals["'$DBNAME'.'$TABLES'"] .read .time')"
                ;;
        write)
                 QUERY="$(mongotop  --rowcount 1 --quiet --json   --port 27017 -u "$USER" -p "$PASSWD" --host  127.0.0.1  --authenticationDatabase "admin" | jq '.totals["'$DBNAME'.'$TABLES'"] .write .time')"
                ;;
        *)
            
             exit 1
esac
echo $QUERY
exit 0

