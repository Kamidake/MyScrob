#!/bin/sh
# Start socat in the background to forward Miget's $PORT (5000) to Scrob's port (7330)
socat TCP-LISTEN:${PORT:-5000},fork,reuseaddr TCP:127.0.0.1:7330 &

# Run Scrob's standard entrypoint in the foreground
exec /entrypoint.sh
