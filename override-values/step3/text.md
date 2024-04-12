
Upgrade the release to set this message: `You rock it !`.


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
echo "message: You rock it !" >> /charts/values.yaml
helm -n dev-ns upgrade --install mock-app /charts/mock-app-1.0.0.tgz  --values /charts/values.yaml
```{{exec}}

</details>

