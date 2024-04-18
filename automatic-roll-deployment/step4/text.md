Since the pod doesn't take in consideration the new message from the updated configmap, we must manually restart the deployment for the new message to take effect. 

Let's restart the pod to display the updated message instead of the previous one.

<br>
<details><summary>Tip</summary>
<br>

```plain
kubectl rollout restart -h
```{{exec}}

</details>


<br>
<details><summary>Solution</summary>
<br>

```plain
kubectl rollout restart deployment -n dev-ns -l app=mock-app
```{{exec}}

</details>

