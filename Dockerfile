FROM golang:1.16 as builder
LABEL maintainer="Carlos Moyses <carlosmoyses@gmail.com>"
WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"
COPY . .
RUN GOOS=linux GOARCH=386 go build -ldflags="-s -w" main.go

FROM scratch
WORKDIR /app
COPY . .
COPY --from=builder /go/src .
CMD ["./main"]