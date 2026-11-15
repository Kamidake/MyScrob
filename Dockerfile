FROM bellamy/scrob:latest

# Keep your local PHT timezone
ENV TZ=Asia/Manila

# Reuse your existing Ubuntu deployment key to maintain session consistency
ENV SECRET_KEY=6ff8208a43e4824e5a8338db4063bb14

# Expose the internal port so Miget's builder detects it
EXPOSE 5000
