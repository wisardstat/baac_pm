# Docker Laravel Application Fix Instructions

## Issues Identified and Fixed

### 1. Database Connection Issues
- **Problem**: `.env` was configured for local development (`127.0.0.1`) instead of Docker service names
- **Fixed**: Updated `.env` to use Docker service names:
  - `DB_HOST=mysql` (instead of `127.0.0.1`)
  - `DB_DATABASE=mysql` (to match Docker MySQL database)
  - `DB_PASSWORD=matrix` (to match Docker MySQL password)
  - `REDIS_HOST=redis` (instead of `127.0.0.1`)

### 2. PHPMyAdmin Configuration
- **Problem**: PHPMyAdmin had incorrect MySQL password
- **Fixed**: Updated `docker-compose.yml` to use correct password `matrix`

### 3. Missing Database Tables
- **Problem**: Laravel migrations haven't been run, causing missing `sessions` table
- **Solution**: Need to run migrations after fixing database connection

## Steps to Fix the Application

### Step 1: Rebuild and Restart Containers
```bash
# Stop all containers
docker-compose down

# Rebuild and start containers
docker-compose up -d --build
```

### Step 2: Run Database Setup
Run the setup script (Ubuntu/Linux):
```bash
chmod +x setup-database.sh
./setup-database.sh
```

Or run manually:
```bash
docker exec baac_pm_app php artisan migrate --force
docker exec baac_pm_app php artisan cache:clear
docker exec baac_pm_app php artisan config:clear
docker exec baac_pm_app php artisan view:clear
```

For Windows users, you can use:
```cmd
setup-database.bat
```

### Step 3: Verify the Application
Access the application at: `http://localhost:8800`

Access PHPMyAdmin at: `http://localhost:8801`
- Server: `mysql`
- Username: `root`
- Password: `matrix`

## What Was Fixed

1. **Environment Variables**: Updated `.env` file for Docker networking
2. **Service Configuration**: Fixed PHPMyAdmin password in `docker-compose.yml`
3. **Database Setup**: Created scripts to run Laravel migrations and clear caches

## Additional Notes

- The application uses database sessions, so the `sessions` table must exist
- Laravel caches need to be cleared after configuration changes
- Docker containers need to be rebuilt when configuration files change

## Troubleshooting

If you still get 500 errors:
1. Check container logs: `docker-compose logs app`
2. Verify database connection: `docker exec baac_pm_app php artisan tinker`
3. Check if migrations ran: `docker exec baac_pm_mysql mysql -u root -pmatrix -e "SHOW TABLES;"`