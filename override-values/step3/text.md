In this step, you'll update the current message value using the values file approach. 

By adopting this method, you'll have the ability to easily monitor the latest configurations directly from your Git repository, which is highly recommended.

Firstly, create a `values.yaml` file within the `/charts` folder. Within this file, set the value of the message to `You rock it!`.

Then, upgrade the release to use the new message by specifying the values file, rather than the previous one.

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
echo "message: You rock it !" >> /charts/values.yaml
helm -n dev-ns upgrade --install mock-app /charts/mock-app-1.0.0.tgz  --values /charts/values.yaml
```{{exec}}

</details>

