In this step, you will verify that deployment rollout is done automatically

Upgrade the release to use the message `You successfully automatic rollout deployment !` instead of the previous one.


<br>
<details><summary>Update message value</summary>
<br>

```plain
helm -n dev-ns upgrade --install mock-app /charts/mock-app/. --set message="You successfully automatic rollout deployment !"
```{{exec}}

</details>


<br>
<details><summary>Verify the content of the deployed configmap </summary>
<br>

```plain
kubectl get cm -n dev-ns -l app=mock-app -ojsonpath='{.items[0].data}' && printf "\n"
```{{exec}}
The message value is updated with: "You successfully automatic rollout deployment !"
</details>

<br>
<details><summary>Verify the content of the deployed container</summary>
<br>

```plain
curl -s http://${SERVICE_IP}:${PORT} -w "\n"
```{{exec}}

as you can see, our application is returning automatically the new message: Hello Killercoda Folks! You successfully automatic rollout deployment !

</details>


