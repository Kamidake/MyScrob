FROM bellamy/scrob:latest
RUN mkdir -p /app/backend/data
RUN chown -R 1000:1000 /app/backend/data
ENV DATABASE_URL=postgres+asyncpg://avnadmin:AVNS_dDgALHkzXp9yRrvtQnq@aiometadata-aiometadata.f.aivencloud.com:18129/defaultdb?sslmode=require

