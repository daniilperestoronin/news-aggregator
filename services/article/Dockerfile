FROM golang as builder
RUN mkdir /build
ADD . /build/
WORKDIR /build
RUN go get -d -v
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o app .

FROM alpine:latest
ENV NEWS_API_KEY ''
RUN apk --no-cache add ca-certificates
COPY --from=builder /build/app /app/
WORKDIR /app
CMD ./app $NEWS_API_KEY
