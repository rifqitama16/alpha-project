#!/bin/bash

AS_INPUT="/home/whoami/Documents/alpha-server/output.log"
AS_OUTPUT="/var/www/html/alpha-server/report.txt"

while true; do
	while IFS=, read SUM HOSTNAME; do
		if [ -s $AS_INPUT ]; then
			echo "$HOSTNAME had $SUM attempts." > $AS_OUTPUT
		fi
	done <<< $(cut -d, -f2 $AS_INPUT | sort | uniq -c | sed 's/ *//' | sed -r 's/\s+/,/')
	sleep 5
done
