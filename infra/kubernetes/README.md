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

## All in one script

```bash
kubectl apply -f ./proxy/
kubectl apply -f ./services/source/
kubectl apply -f ./services/article/
kubectl apply -f ./services/ui/
kubectl apply -f ./monitoring/alertmanager/
kubectl apply -f ./monitoring/prometheus/
kubectl apply -f ./monitoring/kube-state-metrics/
kubectl apply -f ./monitoring/node-exporter/
kubectl apply -f ./monitoring/grafana/
kubectl apply -f ./monitoring/ingress.yaml
kubectl apply -f ./logging/
```


```bash
kubectl delete -f ./proxy/
kubectl delete -f ./services/source/
kubectl delete -f ./services/article/
kubectl delete -f ./services/ui/
kubectl delete -f ./monitoring/alertmanager/
kubectl delete -f ./monitoring/prometheus/
kubectl delete -f ./monitoring/kube-state-metrics/
kubectl delete -f ./monitoring/node-exporter/
kubectl delete -f ./monitoring/grafana/
kubectl delete -f ./monitoring/ingress.yaml
kubectl delete -f ./logging/
```
