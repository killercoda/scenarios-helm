
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
helm -n dev-ns upgrade --install mock-app oci://docker.io/benmalekarim/mock-app --set message="You rock it !"
```{{exec}}

</details>

