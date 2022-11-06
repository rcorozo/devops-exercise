# devops-exercise

BPICHE - DevOps Technical Assessment

## How to test the RESTful API

1. Generate a JWT in: [jwt.rodrigocorozo.com](jwt.rodrigocorozo.com)

2. You can either use bash/test-endpoint.sh or the following command:
   
   ```bash
   curl -X POST \
   -H "X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c" \
   -H "X-JWT-KWY: ${JWT}" \
   -H "Content-Type: application/json" \
   -d '{ “message” : “This is a test”, “to”: “Juan Perez”, “from”: “Rita Asturia”, “timeToLifeSec” : 45 }' \
   https://restapi.rodrigocorozo.com/DevOps
   ```
**Note:** remember to change ${JWT} to the generated JWT in step one.

- RESTful API URL: restapi.rodrigocorozo.com
