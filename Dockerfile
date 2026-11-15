FROM bellamy/scrob:latest-omnibus

# Replace hardcoded port 7330 with Miget's $PORT (defaults to 5000) in Nginx configs, then run the original entrypoint
ENTRYPOINT ["/bin/sh", "-c", "find /etc/nginx -type f -exec sed -i \"s/7330/${PORT:-5000}/g\" {} + && exec /entrypoint.sh"]
