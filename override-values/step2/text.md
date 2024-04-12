
Upgrade the release to set this message: `I override the message using an inline value`.


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
helm -n dev-ns upgrade --install mock-app /charts/mock-app-1.0.0.tgz --set message="I override the message using an inline value"
```{{exec}}

</details>

