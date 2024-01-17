# Use the official PostgreSQL image as the base image
FROM postgres:latest

# Install dependencies required for building pgvector
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    postgresql-server-dev-all

# Clone and build pgvector
RUN git clone --branch v0.5.1 https://github.com/pgvector/pgvector.git \
    && cd pgvector \
    && make \
    && make install

# Copy the initialization script to the container
# Ensure that init-pgvector.sql is in the same directory as the Dockerfile
COPY ./init-pgvector.sql /docker-entrypoint-initdb.d/
