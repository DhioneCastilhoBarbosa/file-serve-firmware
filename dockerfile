docker rm -f firmware-nginx || true
docker run -d --name firmware-nginx \
  -p 8080:8080 \
  -v "$PWD/nginx.conf:/etc/nginx/conf.d/default.conf:ro" \
  -v "$PWD/firmware:/usr/share/nginx/html/firmware:ro" \
  nginx:alpine
