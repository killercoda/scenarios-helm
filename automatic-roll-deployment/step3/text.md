Let's explore what we have changed


<br>
<details><summary>Verify the content of the deployed configmap </summary>
<br>

```plain
kubectl get cm -n dev-ns -l app=mock-app -ojsonpath='{.items[0].data}' && printf "\n"
```{{exec}}
The message value is updated with: "You are overriding the message. Does the pod take this change in consideration ?"
</details>

<br>
<details><summary>Verify the content of the deployed container</summary>
<br>

```plain
export PORT=5000
export SERVICE_IP=$(kubectl get svc -n dev-ns -l app=mock-app -o jsonpath='{.items[0].spec.clusterIP}')
curl -s http://${SERVICE_IP}:${PORT} -w "\n"
```{{exec}}

as you can see, our application is returning the previous message: Hello Killercoda Folks! You recieved this message: You will override this message.

</details>

**Explanation:**

When a Helm chart is upgraded and the ConfigMap it relies on is updated, the pod's environment variables, set during pod creation, remain unchanged. This means the pod doesn't automatically recognize the new ConfigMap data. To apply the changes, a manual pod restart or redeployment is required.

