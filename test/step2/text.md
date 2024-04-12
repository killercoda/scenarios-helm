
Delete the Helm release `apiserver`.


<br>
<details><summary>Tip</summary>
<br>

```plain
helm uninstall -h
```{{exec}}

</details>


<br>
<details><summary>Solution</summary>
<br>

```plain
helm ls -A
helm -n team-yellow uninstall apiserver
```{{exec}}

</details>

