In this scenario, we are deploying a mock application using Helm in the `dev-ns` namespace.

Let's explore what we have deployed


<br>
<details><summary>Verify the deployed release</summary>
<br>

```plain
helm list -n dev-ns
```{{exec}}

We have a single release named `mock-app` deployed in the target namespace.
</details>

<br>
<details><summary>Verify the deployed resources</summary>
<br>

```plain
kubectl get all -n dev-ns
```{{exec}}


</details>

<br>
<details><summary>Verify the content of the deployed container</summary>
<br>

```plain
export PORT=5000
export SERVICE_IP=$(kubectl get svc -n dev-ns -l app=mock-app -o jsonpath='{.items[0].spec.clusterIP}')
curl -s http://${SERVICE_IP}:${PORT} -w "\n"
```{{exec}}

</details>

<br>
<details><summary>Verify the printed message</summary>
<br>

```plain
helm get values --all mock-app -n dev-ns
```{{exec}}
The received message is passed through the default values file. The message value is `You will override this message`.

</details>
