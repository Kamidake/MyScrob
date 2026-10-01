FROM bellamy/scrob:latest-omnibous
RUN mkdir -p /app/backend/data
RUN chown -R 1000:1000 /app/backend/data
