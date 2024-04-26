#docker build --no-cache -t $1/wasm-golang-edge .
docker buildx build --platform linux/arm64 -t $1/wasm-golang-edge --push .
#docker push $1/wasm-golang-edge