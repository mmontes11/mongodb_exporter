FROM golang:1.13.11 AS builder

LABEL maintainer="Martín Montes <martin11lrx@gmail.com>"

ENV WORKDIR /go/src/github.com/percona/mongodb_exporter
RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}
COPY . ${WORKDIR}

RUN make build

FROM alpine:3.12.0

COPY --from=builder /go/src/github.com/percona/mongodb_exporter/bin/mongodb_exporter /mongodb_exporter

CMD [ "/mongodb_exporter" ]
