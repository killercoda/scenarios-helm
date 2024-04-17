Based on the previous step, it's evident that we require a mechanism to automatically trigger the rollout of a deployment whenever a ConfigMap or Secret is updated.

Annotations like checksum/config in Helm charts are used to trigger rolling updates of Kubernetes Deployments when the ConfigMap or Secret referenced by the Deployment changes.

Here's a brief explanation:

**Checksum Annotation:** When Helm installs or updates a chart, it calculates a checksum for the ConfigMap or Secret used in the Deployment. This checksum is stored as an annotation in the Deployment resource.

**Automatic Rollout:** When a change is made to the ConfigMap or Secret, Helm updates the resource and changes the checksum. Kubernetes detects this change and triggers a rolling update of the Deployment to ensure that pods are updated with the new configuration.

By leveraging these annotations, Helm ensures that changes to configuration data are automatically propagated to the relevant resources in the cluster, maintaining consistency and reliability of the application.

<br>
<details><summary>Update deployment template</summary>
<br>

Update the deployment template in `/charts/mock-app/templates/deployment.yaml` to add annotations.

```plain
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Values.appName }}-deployment
  labels:
    app: {{ .Values.appName }}
spec:
  replicas: 1 
  selector:
    matchLabels:
      app: {{ .Values.appName }}
  template:
    metadata:
      annotations:
        checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
      labels:
        app: {{ .Values.appName }}
    spec:
      containers:
        - name: {{ .Values.appName }}-container
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          ports:
          - containerPort: 5000
          envFrom:
          - configMapRef:
              name: {{ .Values.appName }}-configmap
```{{exec}}
</details>