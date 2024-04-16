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

as you can see, our application is returning: Hello Killercoda Folks! You recieved this message: You will override this message.

</details>

<br>
<details><summary>Verify the content of the deployed configmap </summary>
<br>

```plain
kubectl get cm -n dev-ns -l app=mock-app -ojsonpath='{.items[0].data}' && printf "\n"
```{{exec}}
`You will override this message` is the value of the key `MESSAGE` used by our container

</details>

<br>
<details><summary>Verify the content of the configmap template</summary>
<br>

```plain
cat /charts/mock-app/templates/configmap.yaml
```{{exec}}
The received message is passed through helm values. The used value is "message".

</details>

<br>
<details><summary>Verify the content of the default vaules file</summary>
<br>

```plain
cat /charts/mock-app/values.yaml
```{{exec}}
The received message is passed through the default values file. The message value is `You will override this message`.

</details>
