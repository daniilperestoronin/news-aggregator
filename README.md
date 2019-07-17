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
    │   ├── docker          # Docker swarm files
    │   ├── logging         # Tools ang configs for logging
    │   └── monitoring      # Tools ang configs for monitoring
    ├── services            # Services src folder
    │   ├── article         # Article service src and Dockerfile
    │   ├── source          # Source service src and Dockerfile
    │   └── ui              # Ui service src and Dockerfile

## Todo
- [x] Add simple service
- Preparing infrastructure
  - [x] Add docker swarm files
  - [ ] Add Kubernetes 
