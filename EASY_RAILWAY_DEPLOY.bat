@echo off
echo ========================================
echo Railway Backend Deployment Script
echo ========================================
echo.

echo Step 1: Installing Railway CLI...
npm install -g @railway/cli
echo.

echo Step 2: Logging into Railway...
echo (This will open your browser - login and come back)
railway login
echo.

echo Step 3: Navigating to backend folder...
cd backend
echo.

echo Step 4: Deploying backend...
railway up
echo.

echo ========================================
echo Deployment Complete!
echo ========================================
echo.
echo Next: Add environment variables in Railway dashboard
echo See BACKEND_RAILWAY_SETUP.md for the list
echo.
pause
