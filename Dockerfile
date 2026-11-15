FROM bellamy/scrob:latest-omnibus

# Install socat to bridge Miget's required port 5000 to Scrob's port 7330
RUN apk add --no-cache socat

# Forward 0.0.0.0:5000 -> 127.0.0.1:7330 in the background, then start Scrob
ENTRYPOINT ["/bin/sh", "-c", "socat TCP-LISTEN:5000,fork,reuseaddr TCP:127.0.0.1:7330 & exec /entrypoint.sh"]
