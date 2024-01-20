#!/bin/bash

# NOTE: use "chmod +x init.sh" to make this file executable

set -e # Exit immediately if a command exits with a non zero status
set -u # Treat unset variables as an error when substituting

# Source the .env file to load environment variables
if [ -f .env ]; then
  source .env
fi

# Start the Docker Compose File
docker compose up -d

# Wait for the containers to start up
echo "Waiting for containers to start up..."
sleep 5

# Create databases
echo "Creating databases..."

# Loop over each SQL file in the sql directory
for file in sql/*.sql; do
    # Extract the name of the file without the extension
    db_name=$(basename "$file" .sql)

    # Create the database with the extracted name
    docker exec -i postgres createdb -U "$POSTGRES_USER" "$db_name"

    # Load the SQL dump file into the new database
    docker exec -i postgres psql -U "$POSTGRES_USER" -d "$db_name" < "$file"
done

echo "Initialization complete!"