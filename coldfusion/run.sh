#!/bin/bash

set -e

/opt/coldfusion11/cfusion/bin/coldfusion start

while true
do
	sleep 120
	STATUS=$(/opt/coldfusion11/jre/bin/java -classpath /opt/coldfusion11/cfusion/runtime/bin/tomcat-juli.jar:/opt/coldfusion11/cfusion/bin/cf-bootstrap.jar:/opt/coldfusion11/cfusion/bin/cf-startup.jar:/opt/coldfusion11/cfusion/runtime/lib/'*' -Dcoldfusion.home=/opt/coldfusion11/cfusion com.adobe.coldfusion.bootstrap.Bootstrap -status)
	if [ "$STATUS" != "Server is running" ]
		then
		exit 1
	fi

done

exit 1
