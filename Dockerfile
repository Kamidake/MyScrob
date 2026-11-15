FROM bellamy/scrob:latest-omnibus

ENV PORT=5000 \
    FRONTEND_PORT=5000 \
    HOST=0.0.0.0

# Ensure UID 1000 (Hugging Face runtime user) owns the app, postgres, and supervisor paths
RUN mkdir -p /app/backend/data /app/postgres/data /var/run/postgresql /var/log/supervisor && \
    chown -R 1000:1000 /app /var/run/postgresql /var/log/supervisor /etc/supervisor

# Wrap the entrypoint to clear any stale PostgreSQL PID lock on container restart
RUN printf '#!/bin/sh\nrm -f /app/postgres/data/postmaster.pid\nexec /entrypoint.omnibus.sh "$@"\n' > /hf-entrypoint.sh && \
    chmod +x /hf-entrypoint.sh

USER 1000

EXPOSE 5000

ENTRYPOINT ["/hf-entrypoint.sh"]
