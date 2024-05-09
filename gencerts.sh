#!/bin/bash

# Check if the output directory is provided as a command line argument
# Define the output directory for the certificates
output_dir=${1:-.certs}

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"


# Generate CA certificate
openssl genrsa -out "$output_dir/ca.key" 2048
openssl req -new -x509 -days 365 -key "$output_dir/ca.key" -out "$output_dir/ca.crt" -subj "/CN=MyCA/O=Kong Test/OU=IT/L=Amsterdam/ST=North Holland/C=NL"

# Generate server certificate
openssl genrsa -out "$output_dir/server.key" 2048
openssl req -new -key "$output_dir/server.key" -out "$output_dir/server.csr" -subj "/CN=server"
openssl x509 -req -in "$output_dir/server.csr" -CA "$output_dir/ca.crt" -CAkey "$output_dir/ca.key" -CAcreateserial -out "$output_dir/server.crt" -days 365

# Generate cluster certificate
openssl genrsa -out "$output_dir/cluster.key" 2048
openssl req -new -key "$output_dir/cluster.key" -out "$output_dir/cluster.csr" -subj "/CN=kong_clustering"
openssl x509 -req -in "$output_dir/cluster.csr" -CA "$output_dir/ca.crt" -CAkey "$output_dir/ca.key" -CAcreateserial -out "$output_dir/cluster.crt" -days 365

# Generate Redis certificate
openssl genrsa -out "$output_dir/redis.key" 2048
openssl req -new -key "$output_dir/redis.key" -out "$output_dir/redis.csr" -subj "/CN=redis_clustering"
openssl x509 -req -in "$output_dir/redis.csr" -CA "$output_dir/ca.crt" -CAkey "$output_dir/ca.key" -CAcreateserial -out "$output_dir/redis.crt" -days 365

# Cleanup CSR files
rm "$output_dir/server.csr" "$output_dir/cluster.csr" "$output_dir/redis.csr"