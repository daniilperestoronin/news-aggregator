### Deployment: 
	- Deploy Alertmanger: kubectl apply -f k8s/monitoring/alertmanager
	- Deploy Prometheus: kubectl apply -f k8s/monitoring/prometheus
	- Deploy Kube-state-metrics: kubectl apply -f k8s/monitoring/kube-state-metrics
	- Deploy Node-Exporter: kubectl apply -f k8s/monitoring/node-exporter
	- Deploy Grafana: kubectl apply -f k8s/monitoring/grafana
	- Deploy the Ingress: kubectl apply -f k8s/monitoring/ingress.yaml
