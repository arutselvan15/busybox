# busybox

## curl

    curl -i -X GET http://localhost:5000/index
    
## send requests

    sh send-requests.sh http://localhost:5000/index 10

## parallel requests

    sh parallel-requests.sh http://localhost:5000/index 30 5

## load test

    sh load-test.sh http://localhost:5000/index 1s


