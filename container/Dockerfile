#FROM golang:1.20-buster as build-env
#WORKDIR /go/src/app
#ADD . /go/src/app
#RUN go get -d -v ./...
#RUN GOOS=wasip1 GOARCH=wasm go build -o main.wasm

FROM tinygo/tinygo as build-env
WORKDIR /go/src/app
ADD . /go/src/app
RUN go get -d -v ./...
#RUN GOOS=wasip1 GOARCH=wasm go build -o main.wasm
RUN tinygo build -o main.wasm -target wasi main.go

#FROM ubuntu:22.04
FROM python:3.13.0a6-slim-bullseye
#:manylinux2014_aarch64
RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get update;apt-get install curl git wget -y;
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash
COPY --from=build-env /go/src/app /
CMD ["wasmedge", "--dir", ".:/", "/main.wasm"]