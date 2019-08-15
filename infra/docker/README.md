# Create cluster using Docker Swarm

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
