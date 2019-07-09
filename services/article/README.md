# Article service

### Build

```bash
docker build -t article:0.0.1 .
```

### Run

```bash
docker run -p 8082:8082 -e api_key="$NEWS_API_KEY" article:0.0.1

```

Get ```NEWS_API_KEY``` here: https://newsapi.org
