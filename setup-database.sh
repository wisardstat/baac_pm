#!/bin/bash

# Wait for MySQL to be ready
echo "Waiting for MySQL to be ready..."
while ! docker exec baac_pm_mysql mysqladmin ping -h"localhost" --silent; do
    sleep 2
done

echo "MySQL is ready! Running Laravel migrations..."

# Run Laravel migrations
docker exec baac_pm_app php artisan migrate --force

# Clear Laravel cache
docker exec baac_pm_app php artisan cache:clear

# Clear config cache
docker exec baac_pm_app php artisan config:clear

# Clear view cache
docker exec baac_pm_app php artisan view:clear

echo "Database setup completed!"