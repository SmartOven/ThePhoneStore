#!/bin/bash

THE_PHONE_STORE_SECRET_ID=e6qc5aglkkpq1umcsfnt
PROPERTIES_FILE=lockbox.properties

kill -15 $(cat thephonestore-backend.pid)
java -jar properties-fetcher.jar "$YC_OAUTH_TOKEN" "$THE_PHONE_STORE_SECRET_ID" "$PROPERTIES_FILE" > properties-fetcher.log
java -jar thephonestore.jar --spring.config.import="$PROPERTIES_FILE" > logs.log &
echo $! > thephonestore-backend.pid