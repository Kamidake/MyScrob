FROM bellamy/scrob:latest

# Install socat
RUN if command -v apk >/dev/null 2>&1; then \
      apk add --no-cache socat; \
    else \
      apt-get update && apt-get install -y --no-install-recommends socat && rm -rf /var/lib/apt/lists/*; \
    fi

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
