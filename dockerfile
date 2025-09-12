FROM nginx:alpine

# Copia a config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Cria diretório de firmware
RUN mkdir -p /usr/share/nginx/html/firmware

# Tornar a pasta montável no runtime
VOLUME ["/usr/share/nginx/html/firmware"]

EXPOSE 80

# Healthcheck simples
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -qO- http://127.0.0.1/firmware/ >/dev/null 2>&1 || exit 1
