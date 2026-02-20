
Install the Helm chart `podinfo/podinfo` into *Namespace* `team-yellow`.

The release should've the name `devserver`.



<br>
<details><summary>Tip</summary>
<br>

```plain
helm install -h
```{{exec}}

</details>



<br>
<details><summary>Solution</summary>
<br>

```plain
helm -n team-yellow install devserver podinfo/podinfo
```{{exec}}

</details>

