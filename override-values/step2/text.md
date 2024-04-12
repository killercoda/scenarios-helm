In this step, you will replace the existing message value using the inline values method. 

Upgrade the release to use the message `You are overriding the message using an inline value. Good job !` instead of the previous one.

**NOTE: The chart is packaged and stored in /charts folder**

<br>
<details><summary>Tip</summary>
<br>

```plain
helm upgrade -h
```{{exec}}

</details>


<br>
<details><summary>Solution</summary>
<br>

```plain
helm -n dev-ns upgrade --install mock-app /charts/mock-app-1.0.0.tgz --set message="You are overriding the message using an inline value. Good job !"
```{{exec}}

</details>

