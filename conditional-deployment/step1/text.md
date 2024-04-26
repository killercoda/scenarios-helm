Let's explore what we have in our scenario


<br>
<details><summary>Verify namespaces</summary>
<br>

```plain
kubectl get ns
```{{exec}}

We notice that we have 2 namespaces that will be used in that scenario `prod-ns` and `dev-ns`
</details>

<br>
<details><summary>Verify chart templates</summary>
<br>

Our Helm chart is stored in /charts/mock-app. Let's explore its templates.

```plain
ls /charts/mock-app/templates
```{{exec}}
The chart is composed of: deployment, configmap, service and hpa.

In our scenario, we will be focusing on the hpa.

HPA = Horizontal Pod Autoscaler

</details>
