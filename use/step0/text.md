## Exploring the Kubernetes Environment

Before we dive into Helm, let's take a moment to explore the Kubernetes environment we're working with.

### Check Cluster Nodes

Run the following command to list all the nodes available in the cluster:

```bash
kubectl get nodes
```{{exec}}

This will show you the master and worker nodes in your cluster, along with their status.

### View All Pods Across Namespaces

To get an idea of what's running in the cluster, execute:

```bash
kubectl get pods --all-namespaces
```{{exec}}

This command lists all the pods running in all namespaces, giving you a comprehensive view of the cluster's current state.

### Cluster Information

Finally, let's check some basic information about the cluster:

```bash
kubectl cluster-info
```{{exec}}

This command provides URLs for Kubernetes master and other services running in the cluster.

---

Now that we have a good understanding of our Kubernetes environment, let's move on to creating our first Helm chart.

