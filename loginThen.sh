#!/bin/bash
az login --service-principal -u $APP_ID -p $PASSWORD --tenant $TENANT

if [ $? -ne 0 ]; then
    echo "fail login" >&2
    exit 1
fi

$*

if [ $? -ne 0 ]; then
    echo "fail command" >&2
    exit 1
fi
