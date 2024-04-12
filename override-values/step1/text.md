
Write the list of all Helm releases in the cluster into `/root/releases`.




<br>
<details><summary>Info</summary>
<br>

```plain
Helm Chart: Kubernetes YAML template-files combined into a single package, Values allow customisation

Helm Release: Installed instance of a Chart

Helm Values: Allow to customise the YAML template-files in a Chart when creating a Release
```

</details>





<br>
<details><summary>Tip 1</summary>
<br>

```plain
helm ls
```{{exec}}

</details>



<br>
<details><summary>Tip 2</summary>
<br>

```plain
helm ls -A
```{{exec}}

</details>


<br>
<details><summary>Solution</summary>
<br>

Helm charts can be installed in any *Namespaces*, so here we have to look in all.

<br>

```plain
helm ls -A > /root/releases
```{{exec}}

</details>

