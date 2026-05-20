@echo off
echo ============================================
echo    ExamGuard Pro - Build Script
echo ============================================
echo.

echo [1/3] Installing dependencies...
pip install -r requirements.txt
if errorlevel 1 (
    echo ERROR: Failed to install dependencies!
    pause
    exit /b 1
)

echo.
echo [2/3] Building .exe with PyInstaller...
pyinstaller --onefile --noconsole --name "ExamGuard Pro" tracker.py
if errorlevel 1 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo [3/3] Done!
echo ============================================
echo  Your .exe is ready at:
echo  dist\ExamGuard Pro.exe
echo ============================================
echo.
echo Logs will be saved to your Desktop in:
echo  Desktop\exam_logs\
echo.
pause
