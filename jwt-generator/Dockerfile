FROM golang:alpine AS builder
WORKDIR /build
COPY go.mod .
COPY go.sum .
COPY jwt-generator.go jwt-generator.go
RUN \
    go mod download && \
    go build -o JWTGenerator jwt-generator.go

FROM alpine
WORKDIR /build
COPY --from=builder /build/JWTGenerator /build/JWTGenerator
CMD ["./JWTGenerator"]