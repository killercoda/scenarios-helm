#!/bin/bash

# for Validator to verify as success, the script needs to exit with code 0 (no error)
# and HAS to ONLY output "done". Every other text output will be taken as error.

# NOTE: there seems to be a limit after which the Validator verify command is not valid, even
# though exit code 0 and "done" is returned. This could be after X amount of commands, or too
# long execution time, not sure why. Hence this file should be as short as possible.

LOGFILE=/ks/step2-verify.log
#set -e # exit once any command fails

{
    set +e
    target_message="Hello Killercoda Folks! You recieved this message: You are overriding the message. Does the pod take this change in consideration ?"
    # Retrieve the value of the key "message" from the mock-app release
    export PORT=5000
    export SERVICE_IP=$(kubectl get svc -n dev-ns -l app=mock-app -o jsonpath='{.items[0].spec.clusterIP}')
    message=(curl -s http://${SERVICE_IP}:${PORT} -w "\n")
    # Check if the message is not "Test is valid"
    if [ "$message" != "$target_message" ]; then
        exit 1
    fi

} >> ${LOGFILE} 2>&1

echo "done" # let Validator know success

