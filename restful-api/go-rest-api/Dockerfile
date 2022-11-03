FROM golang:alpine AS builder
WORKDIR /build
COPY go.mod .
COPY go.sum .
COPY main.go main.go
RUN \
    go mod download && \
    go build -o RESTfulAPI main.go

FROM alpine
WORKDIR /build
COPY --from=builder /build/RESTfulAPI /build/RESTfulAPI
CMD ["./RESTfulAPI"]