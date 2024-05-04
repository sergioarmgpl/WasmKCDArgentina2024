docker build --platform linux/arm64 -t $1/wasm-golang-edge:v1.0.0-2 .
docker push $1/wasm-golang-edge:v1.0.0-2