FROM golang:1.16.3 as builder

LABEL maintainer="Carlos Moyses <carlosmoyses@gmail.com>"

WORKDIR $GOPATH/go/src

COPY . .

RUN go build main.go

FROM scratch
COPY --from=builder . .
CMD ./main