docker build -t $1/wasm-golang-edge:v1 .
#docker buildx build --platform linux/arm64 -t $1/wasm-golang-edge --push .
docker push $1/wasm-golang-edge:v1