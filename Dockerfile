FROM golang:1.13

LABEL maintainer="Martín Montes <martin11lrx@gmail.com>"

WORKDIR /go/src/github.com/percona/mongodb_exporter

COPY . .

RUN make build

FROM quay.io/prometheus/busybox:latest

LABEL maintainer="Martín Montes <martin11lrx@gmail.com>"

COPY --from=0 /go/src/github.com/percona/mongodb_exporter/bin/mongodb_exporter /bin/mongodb_exporter

EXPOSE 9216

ENTRYPOINT [ "/bin/mongodb_exporter" ]