@echo off
echo Waiting for MySQL to be ready...

:wait_loop
docker exec baac_pm_mysql mysqladmin ping -h"localhost" --silent >nul 2>&1
if errorlevel 1 (
    timeout /t 2 >nul
    goto wait_loop
)

echo MySQL is ready! Running Laravel migrations...

docker exec baac_pm_app php artisan migrate --force

echo Clearing Laravel cache...
docker exec baac_pm_app php artisan cache:clear

echo Clearing config cache...
docker exec baac_pm_app php artisan config:clear

echo Clearing view cache...
docker exec baac_pm_app php artisan view:clear

echo Database setup completed!
pause