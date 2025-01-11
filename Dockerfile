# Use the official PostgreSQL image as a base
FROM postgres:latest

# Set the working directory
WORKDIR /docker-entrypoint-initdb.d

# Copy your SQL file into the container
COPY dbfile.sql /docker-entrypoint-initdb.d/

# Set environment variables (optional, but recommended)
ENV POSTGRES_DB=lottety
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=rounak

# Expose the default PostgreSQL port
EXPOSE 5432
