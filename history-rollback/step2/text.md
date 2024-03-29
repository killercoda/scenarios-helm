
The helm deployment of the webserver is sucessfull but the pods are failing to upgrade, check the values passed in the current and previous revisions.
You can use `helm get` on the previous revisions of an Helm release with `--revision`.

Save the output of `helm get values` for the last correct revision in `/root/values`

