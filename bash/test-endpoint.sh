#!/bin/bash

HOST="restapi.rodrigocorozo.com"
JWT="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJjbGllbnQiOiJCUElDSEUiLCJleHAiOjE2Njc2NzI4NTZ9.UHoUlOrFqkYSZZ1SYzfNBjYzmPiUyauLbj_r6Xzpuoo"

curl -X POST \
-H "X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c" \
-H "X-JWT-KWY: ${JWT}" \
-H "Content-Type: application/json" \
-d '{ "message" : "This is a test", "to": "Juan Perez", "from": "Rita Asturia", "timeToLifeSec" : 45 }' \
https://${HOST}/DevOps