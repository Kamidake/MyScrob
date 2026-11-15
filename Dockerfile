FROM bellamy/scrob:latest

ENV SCROB_DATA_DIR=/app/backend/data

USER root
RUN mkdir -p /app/backend/data

EXPOSE 7330
