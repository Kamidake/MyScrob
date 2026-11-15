FROM bellamy/scrob:latest

ENV TZ=Asia/Manila
ENV SECRET_KEY=6ff8208a43e4824e5a8338db4063bb14

# Install socat to handle Miget's dynamic port routing
USER root
RUN apk add --no-cache socat

# Create a wrapper to forward Miget's $PORT to Scrob's hardcoded 7330 port
RUN echo '#!/bin/sh' > /wrapper.sh && \
    echo 'echo "Forwarding Miget port ${PORT:-5000} to Scrob port 7330..."' >> /wrapper.sh && \
    echo 'socat TCP-LISTEN:${PORT:-5000},fork,reuseaddr TCP:127.0.0.1:7330 &' >> /wrapper.sh && \
    echo 'exec /entrypoint.sh "$@"' >> /wrapper.sh && \
    chmod +x /wrapper.sh

# Use the wrapper as the new entrypoint
ENTRYPOINT ["/wrapper.sh"]
