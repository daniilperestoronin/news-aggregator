# Source service

### Build

```bash
docker build -t source:0.0.1 .
```

### Run

```bash
docker run -p 8081:8081 -e api_key="$NEWS_API_KEY" source:0.0.1

```

Get ```NEWS_API_KEY``` here: https://newsapi.org
