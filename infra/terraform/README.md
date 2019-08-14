### Create project on google cloud

```bash
# Create project on Google Cloud Platform
gcloud projects create news-agg-host-dev --name="News aggregator"
```

### Create Kubernetes cluster in GCP

```bash
terraform init
terraform plan
terraform apply
```

### Get credentials for kubernetes

```bash
gcloud container clusters get-credentials news-agg-host-dev-europe-north1-a --zone europe-north1-a --project news-agg-host-dev
```

### Check

```bash
kubectl get nodes
```
