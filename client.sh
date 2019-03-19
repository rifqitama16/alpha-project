#!/bin/bash

AC_INPUT="/var/log/auth.log"
AC_UNAME="whoami"
AC_IPADD="192.168.56.11"
AC_OUTPUT="/home/whoami/Documents/alpha-server/output.log"

tail -s 0 -n 1 -f $AC_INPUT | while read LINE; do
	if grep -Eq "sshd.*Failed|sshd.*Accepted"; then
		TIMESTAMP="$(date +%d-%m-%Y+%T)"
		HOSTNAME="$(hostname -f)"
		ssh $AC_UNAME@$AC_IPADD echo "$TIMESTAMP,$HOSTNAME >> $AC_OUTPUT"
	fi
done
