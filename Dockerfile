FROM golang:1.13.11

LABEL maintainer="Martín Montes <martin11lrx@gmail.com>"

ENV WORKDIR /go/src/github.com/percona/mongodb_exporter
RUN mkdir -p ${WORKDIR}
WORKDIR ${WORKDIR}
COPY . ${WORKDIR}

RUN make build

EXPOSE 9113

ENTRYPOINT [ "bin/mongodb_exporter" ]
