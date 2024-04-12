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
    # Retrieve the value of the key "message" from the mock-app release
    message=$(helm get values --all mock-app -n dev-ns | yq e '.message' -)

    # Check if the message is not "Test is valid"
    if [ "$message" != "You rock it !" ]; then
        exit 1
    fi

    # Check if the file exists
    if [ -f "/charts/values.yaml" ]; then
        # Check if the file does not contain the specified string
        if ! grep -q "message: You rock it!" "$file_path"; then
            exit 1
        fi
    else
        exit 1
    fi

} >> ${LOGFILE} 2>&1

echo "done" # let Validator know success

