FROM bellamy/scrob:latest

ENV SCROB_DATA_DIR=/data/scrob_data

USER root
RUN mkdir -p /data/scrob_data && \
    chown -R 1000:1000 /data

USER 1000

EXPOSE 7330
