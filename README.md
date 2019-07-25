[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e9f6f69e284240249b110695d6f8ecce)](https://app.codacy.com/app/daniilperestoronin/news-aggregator?utm_source=github.com&utm_medium=referral&utm_content=daniilperestoronin/news-aggregator&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://travis-ci.org/daniilperestoronin/go-news-aggregator.svg?branch=master)](https://travis-ci.org/daniilperestoronin/go-news-aggregator)

# Simple News Aggregator

Simple News Aggregator is tool for news aggregating. 
In current moment using [News Api](https://newsapi.org/) to get information.
In the future paining add another sources.

## Built With

#### Service stack:
- [Golang]()
- [Gin]()
- [React]()
- [Docker]()

#### Infrastructure:

##### Container orchestration:
- [Docker swarm]()

##### Reverse proxy
- [Traefik]()

##### Logging:
- [Jaeger]()
- [Fluentd]()
- [Elasticsearch]()
- [Kibana]()

##### Monitoring:
- [Prometheus]()
- [Cadvisor]()
- [Grafana]()

##### Alerting:
- [Alertmanager]()


## Repository structure

    .
    ├── infra               # Infrastructure things
    │   ├── config          # Infrastructure configuration files
    │   │  ├── logging      # Logging configuration files
    │   │  ├── monitoring   # Monitoring configuration files
    │   │  ├── proxy        # Proxy configuration files
    │   ├── docker          # Docker swarm files
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

```bash

cd infra/docker/

# Create project on Google Cloud Platform
gcloud projects create news-agg-host --name="News aggregator"

# Specified name Google Cloud Project 
export GOOGLE_PROJECT=news-agg-host

#create firewall rules
gcloud compute firewall-rules create news-agg-host --allow tcp:80

# Create docker host
docker-machine create --driver google \
    --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts \
    --google-machine-type n1-standard-1 \
    --google-zone europe-west1-b \
    news-agg-host

# Configure the docker client to the remote docker daemon
eval $(docker-machine env news-agg-host)

#Build services
docker-compose build

# Up services
docker-compose up -d

# Up monitoring environment
docker-compose -f docker-compose-logging.yml up -d

# Up logging environment
docker-compose -f docker-compose-logging.yml up -d
```

## Todo
- [x] Add simple service
- Preparing infrastructure
  - [x] Add docker swarm files
  - [ ] Add Kubernetes 
