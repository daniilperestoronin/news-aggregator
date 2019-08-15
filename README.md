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

## Build

(!) Do not forget add .env file

```bash
cd infra/docker/
docker-compose build
```

## Deploy on Google Cloud Platform

