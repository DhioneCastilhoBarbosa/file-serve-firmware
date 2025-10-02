FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY firmware/ /usr/share/nginx/html/firmware/
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1:8080/firmware/ >/dev/null 2>&1 || exit 1