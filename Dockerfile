FROM bellamy/scrob:latest-omnibus

# Install socat and netcat for port availability checks
RUN if command -v apk >/dev/null 2>&1; then \
      apk add --no-cache socat netcat-openbsd; \
    else \
      apt-get update && apt-get install -y --no-install-recommends socat netcat-openbsd && rm -rf /var/lib/apt/lists/*; \
    fi

# Start the app, wait for port 7330 to be ready, then start socat on $PORT
ENTRYPOINT ["/bin/sh", "-c", "/entrypoint.sh & \
  echo 'Waiting for Scrob to start on port 7330...' && \
  while ! nc -z 127.0.0.1 7330; do sleep 2; done && \
  echo 'Scrob is up! Starting socat proxy on port ${PORT:-5000}...' && \
  exec socat TCP-LISTEN:${PORT:-5000},fork,reuseaddr TCP:127.0.0.1:7330"]
