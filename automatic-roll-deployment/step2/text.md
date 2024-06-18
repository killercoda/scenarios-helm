In this step, you will replace the existing message value.

Upgrade the release to use the message `You are overriding the message. Does the pod take this change in consideration?` instead of the previous one.

**NOTE: The chart is stored in /charts/mock-app folder**

<br>
<details><summary>Tip</summary>
<br>

```plain
helm upgrade -h
```{{exec}}

You can check the scenario https://killercoda.com/helm/scenario/override-values

</details>


<br>
<details><summary>Solution</summary>
<br>

```plain
helm -n dev-ns upgrade mock-app /charts/mock-app/. --set message="You are overriding the message. Does the pod take this change in consideration?"
```{{exec}}

</details>

