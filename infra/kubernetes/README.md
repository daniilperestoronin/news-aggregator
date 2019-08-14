# Apply  scripts


## Apply proxy

```bash
kubectl apply -f ./proxy/
```

## Apply services

```bash
kubectl apply -f ./services/source/
```

```bash
kubectl apply -f ./services/article/
```

```bash
kubectl apply -f ./services/ui/
```

## Apply Monitoring 

- Deploy Alertmanger: 
```bash
kubectl apply -f ./monitoring/alertmanager/
```
- Deploy Prometheus: 
```bash
kubectl apply -f ./monitoring/prometheus/
```
- Deploy Kube-state-metrics: 
```bash
kubectl apply -f ./monitoring/kube-state-metrics/
```
- Deploy Node-Exporter:
```bash
kubectl apply -f ./monitoring/node-exporter/
```
- Deploy Grafana: 
```bash
kubectl apply -f ./monitoring/grafana/
```
- Deploy the Ingress:
```bash
kubectl apply -f ./monitoring/ingress.yaml
```

# Logging Infrastructure

This is a sample setup for automated logging with the elastic stack on Kubernetes.

It uses:
- Elasticsearch for storing and searching logs.
- Kibana for viewing them.
- Logstash for analysing and breaking down logs.
- Filebeat for pushing all app logs to logstash.
- Metricbeat for pushing node analytics to elasticsearch.
- Curator for regularly deleting old logs.

## Apply logging

```bash
kubectl apply -f ./logging/
```
