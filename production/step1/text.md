### Helm install flags

Let's imagine that you have to deploy the usual apache webserver to production but the CI/CD is not working.

The first prudent step would be to run `helm install` with the `--dry-run` flag. This will render the chart (impling that the YAML manifests are syntactically correct) and contact the Kubernetes API which will test if the manifests can be accepted or not (CRD not installed, Kubernetes Validating Webhook, etc). To have more information use the `--debug` flag.

`helm install webserver bitnami/apache --dry-run --debug`{{exec}}

After checking the above, we can introduce the `--wait` flag *if set, will wait until all Pods, PVCs, Services, and minimum number of Pods of a Deployment, StatefulSet, or ReplicaSet are in a ready state before marking the release as successful*. The default wait time is 5m but it can be changed with `--timeout`.

Before attempting installation we need to introduce the `--atomic` flag, that will revert the changes if the operation is failed otherwise you'll have a partially installed chart in case of a failed release.

Now we can try the installation
`helm install webserver bitnami/apache --wait --timeout 10s --atomic --debug`{{exec}}

Oh, no. It failed. You can check that no Helm release was created and that there are no resources left.

