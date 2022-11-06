#!/bin/bash

HOST="restapi.rodrigocorozo.com"
JWT=""

curl -X POST \
-H "X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c" \
-H "X-JWT-KWY: ${JWT}" \
-H "Content-Type: application/json" \
-d '{ "message" : "This is a test", "to": "Juan Perez", "from": "Tomás Pérez", "timeToLifeSec" : 45 }' \
https://${HOST}/DevOps