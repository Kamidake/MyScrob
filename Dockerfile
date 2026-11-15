FROM bellamy/scrob:latest-omnibus

RUN if command -v apk >/dev/null 2>&1; then \
      apk add --no-cache socat; \
    else \
      apt-get update && apt-get install -y --no-install-recommends socat && rm -rf /var/lib/apt/lists/*; \
    fi

ENTRYPOINT ["/bin/sh", "-c", "/entrypoint.sh & sleep 5 && socat TCP-LISTEN:${PORT:-5000},fork,reuseaddr TCP:127.0.0.1:7330"]
