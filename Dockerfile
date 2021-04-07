FROM golang:onbuild
LABEL maintainer="Carlos Moyses <carlosmoyses@gmail.com>"
WORKDIR /go/src
ENV PATH="/go/bin:${PATH}"
COPY . .
RUN apt-get update && \
    apt-get install build-essential librdkafka-dev golang -y
RUN go build -o main .
CMD ["./main"]