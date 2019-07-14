# UI service

### Build

```bash
docker build --build-arg REACT_APP_SOURCE_HOST="http://localhost:8081/" --build-arg REACT_APP_ARTICLE_HOST="http://localhost:8082/"  -t ui:0.0.1 .
```

### Run

```bash
docker run -p 80:80  ui:0.0.1
```
