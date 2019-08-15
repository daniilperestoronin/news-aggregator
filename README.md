[![Build Status](https://travis-ci.org/daniilperestoronin/news-aggregator.svg?branch=master)](https://travis-ci.org/daniilperestoronin/news-aggregator)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e9f6f69e284240249b110695d6f8ecce)](https://app.codacy.com/app/daniilperestoronin/news-aggregator?utm_source=github.com&utm_medium=referral&utm_content=daniilperestoronin/news-aggregator&utm_campaign=Badge_Grade_Dashboard)

# Simple News Aggregator

Simple News Aggregator is tool for news aggregating. 
In current moment using [News Api](https://newsapi.org/) to get information.
In the future paining add another sources.

## Technology Stack

### Service stack:

#### Backend
- [Golang](https://golang.org/)
- [Gin](https://gin-gonic.com/)
#### Frontend
- [React](https://reactjs.org/)
#### Container Platform
- [Docker](https://www.docker.com/)

### Infrastructure:
#### Cloud provider
- [Google Cloud Platform‎](https://cloud.google.com/)
#### Infrastructure provisioning tool:
- [Terraform](https://www.terraform.io/)
#### Container orchestration:
- [Kubernetes](https://kubernetes.io/)
#### A reverse proxy / load balancer:
- [Traefik](https://traefik.io/)
#### CI/CD
- [Travis](https://travis-ci.org/)
#### Logging:
- [Jaeger](https://www.jaegertracing.io/)
- [Fluentd](https://www.fluentd.org/)
- [Elasticsearch](https://www.elastic.co/products/elasticsearch)
- [Kibana](https://www.elastic.co/products/kibana)
#### Monitoring:
- [Prometheus](https://prometheus.io/)
- [Grafana](https://grafana.com/)
- [Alertmanager](https://prometheus.io/docs/alerting/alertmanager/)

## Repository structure
    .
    ├── infra               # Infrastructure things
    │   ├── config          # Infrastructure configuration files
    │   │  ├── logging      # Logging configuration files
    │   │  ├── monitoring   # Monitoring configuration files
    │   │  ├── proxy        # Proxy configuration files
    │   ├── docker          # Docker swarm files
    │   ├── kubernetes      # Kubernetes files
    │   ├── terraform       # Terraform files
    ├── services            # Services src folder
    │   ├── article         # Article service src and Dockerfile
    │   ├── source          # Source service src and Dockerfile
    │   └── ui              # Ui service src and Dockerfile

## Build and deploy 

```bash
# Build Services docker images and push it on Docker Hub
# (!) Do not forget add .env file
docker-compose -f ./infra/docker/docker-compose.yml build
docker-compose -f ./infra/docker/docker-compose.yml push

# Create project on Google Cloud Platform
gcloud projects create news-agg-host-dev --name="News aggregator"

# Create Kubernetes cluster in GCP
terraform init ./infra/terraform/
terraform plan ./infra/terraform/
terraform apply ./infra/terraform/

# Get credentials for kubernetes
gcloud container clusters get-credentials news-agg-host-dev-europe-north1-a --zone europe-north1-a --project news-agg-host-dev

# Deploy Services in Kubernetes

# Deploy Load balanser and proxy
kubectl apply -f ./infra/kubernetes/proxy/

# Deploy Load balanser and proxy
kubectl apply -f ./infra/kubernetes/services/source/
kubectl apply -f ./infra/kubernetes/services/article/
kubectl apply -f ./infra/kubernetes/services/ui/

# Deploy Load balanser and proxy
kubectl apply -f ./infra/kubernetes/monitoring/alertmanager/
kubectl apply -f ./infra/kubernetes/monitoring/prometheus/
kubectl apply -f ./infra/kubernetes/monitoring/kube-state-metrics/
kubectl apply -f ./infra/kubernetes/monitoring/node-exporter/
kubectl apply -f ./infra/kubernetes/monitoring/grafana/
kubectl apply -f ./infra/kubernetes/monitoring/ingress.yaml

# Deploy Load balanser and proxy
kubectl apply -f ./infra/kubernetes/logging/
```

## Author
Daniil Perestoronin
- [github/daniilperestoronin](https://github.com/daniilperestoronin)
- [mail/perestoronin.daniil@gmail.com](mailto:perestoronin.daniil@gmail.com)

## License
Copyright © 2019 [Daniil Perestoronin](https://github.com/daniilperestoronin) Released under the [MIT license](./LICENSE).
