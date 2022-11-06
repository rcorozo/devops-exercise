#!/bin/bash

HOST="restapi.rodrigocorozo.com"
JWT="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJCUElDSEUiLCJleHAiOjE2Njc3MzYzNzZ9.tvGu2XF_HC8lbDXHfJy9daQzoz-sL2p88y8-HcWZxxo"

curl -X POST \
-H "X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c" \
-H "X-JWT-KWY: ${JWT}" \
-H "Content-Type: application/json" \
-d '{ "message" : "This is a test", "to": "Juan Perez", "from": "Rodrigo Corozo", "timeToLifeSec" : 45 }' \
https://${HOST}/DevOps