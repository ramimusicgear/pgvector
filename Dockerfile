FROM postgres:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    postgresql-server-dev-all

# Install pgvector
RUN git clone https://github.com/ankane/pgvector.git \
    && cd pgvector \
    && make \
    && make install

# Copy the initialization script
COPY ./init-pgvector.sql /docker-entrypoint-initdb.d/