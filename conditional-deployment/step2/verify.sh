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
    # Check if HPA exists in prod-ns namespace
    if kubectl get hpa -n prod-ns | grep -q hpa; then
        echo "HPA is deployed in prod-ns namespace."
    else
        exit 1
    fi

    # Check if HPA exists in dev-ns namespace
    if kubectl get hpa -n dev-ns | grep -q hpa; then
        exit 1
    fi


} >> ${LOGFILE} 2>&1

echo "done" # let Validator know success

