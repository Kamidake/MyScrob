FROM bellamy/scrob:latest-omnibus

# Install socat
RUN if command -v apk >/dev/null 2>&1; then \
      apk add --no-cache socat; \
    else \
      apt-get update && apt-get install -y --no-install-recommends socat && rm -rf /var/lib/apt/lists/*; \
    fi

# Run Scrob's entrypoint in the background, keeping socat active in the foreground on $PORT
ENTRYPOINT ["/bin/sh", "-c", "/entrypoint.sh & socat TCP-LISTEN:${PORT:-5000},fork,reuseaddr TCP:127.0.0.1:7330"]
