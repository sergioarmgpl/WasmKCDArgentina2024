FROM tinygo/tinygo as build-env
WORKDIR /go/src/app
ADD . /go/src/app
RUN tinygo build -o main.wasm -target wasi main.go

FROM ubuntu:20.04
RUN apt-get update;apt-get install curl git python3 wget -y;
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- -p /usr/local
COPY --from=build-env /go/src/app /
CMD ["wasmedge", "--dir", ".:/", "/main.wasm"]