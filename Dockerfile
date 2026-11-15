FROM bellamy/scrob:latest-omnibus

# Install socat (Alpine vs Debian/Ubuntu safety check)
RUN if command -v apk >/dev/null 2>&1; then \
      apk add --no-cache socat; \
    else \
      apt-get update && apt-get install -y --no-install-recommends socat && rm -rf /var/lib/apt/lists/*; \
    fi

# Forward Miget's assigned $PORT (defaults to 5000) to Scrob's internal port (7330)
ENTRYPOINT ["/bin/sh", "-c", "socat TCP-LISTEN:${PORT:-5000},fork,reuseaddr TCP:127.0.0.1:7330 & exec /entrypoint.sh"]
