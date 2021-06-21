#!/bin/sh

URL=$1
TOKEN=$2
OPTIONS=$3
WEBHOOK=$4
WEBHOOKOPTS=$5

#ARGS="-f json --url ${URL}"
#[  -n "$2" ] && ARGS="${ARGS} --api-token=${TOKEN}"
#[  -n "$3" ] && ARGS="${ARGS} ${OPTIONS}"
#
#WPSCAN=/usr/local/bundle/bin/wpscan
#
#$WPSCAN --update

#RESULT=$($WPSCAN $ARGS)
RESULT=$(cat /example.json)
RESULT_B64=$(echo $RESULT | base64)

echo ::set-output name=result::$RESULT
echo ::set-output name=resultb64::$RESULT_B64

[  -n "$WEBHOOK" ] && python3 /webhook.py $WEBHOOKOPTS
