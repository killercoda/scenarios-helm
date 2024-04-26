After reviewing the context, the task involves introducing a condition into the Horizontal Pod Autoscaler (HPA) template to meet the following requirements:

- Deploy an HPA resource for releases in the `prod` environment.
- Do not deploy an HPA resource for releases in any other environment

Deploy a `mock-app-prod` release in `prod-ns` namespace and a `mock-app-dev` release in `dev-ns` to check the solution.

**NOTE: The chart is packaged and stored in /charts/mock-app folder**

<br>
<details><summary>Tip</summary>
<br>

You can use the value "environment" as the parameter for the condition.
The environment parameter will be provided during the installation of the release.


</details>


<br>
<details><summary>Solution</summary>
<br>

Update hpa.yaml template by adding the condition

```
{{- if eq .Values.environment "prod" }}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
.
.
.
{{- end }}
```

Deploy 
```plain
helm -n prod-ns upgrade --install mock-app-prod /charts/mock-app/. --set environment=prod
```{{exec}}

```plain
helm -n dev-ns upgrade --install mock-app-dev /charts/mock-app/. --set environment=dev
```{{exec}}

</details>

