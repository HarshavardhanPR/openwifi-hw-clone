@echo off
REM ============================================================================
REM DEBUGGING - Vivado Simulation Batch Script for Windows
REM ============================================================================

REM IMPORTANT: Double-check that this path is EXACTLY correct for your PC.
set VIVADO_PATH=D:/Apps/Vivado/Application/Vivado/2024.2

echo ----------------------------------------------------
echo STEP 1: Checking Vivado Path...
echo ----------------------------------------------------
echo Vivado path is set to: %VIVADO_PATH%

REM Check if the settings file actually exists at that path
if not exist "%VIVADO_PATH%\settings64.bat" (
    echo.
    echo FATAL ERROR: Cannot find settings64.bat!
    echo Please correct the VIVADO_PATH variable in this script.
    echo The script will now exit.
    pause
    exit
)

echo Path seems correct.
pause
echo.


echo ----------------------------------------------------
echo STEP 2: Calling Vivado Environment Setup...
echo ----------------------------------------------------
call %VIVADO_PATH%\settings64.bat
echo Vivado environment setup script has been called.
pause
echo.


echo ----------------------------------------------------
echo STEP 3: Running Vivado with Tcl script...
echo This may take a moment.
echo ----------------------------------------------------
vivado -mode batch -source simulate.tcl -nojournal -nolog

REM Check the error code of the Vivado process
if %errorlevel% == 0 (
  echo ----------------------------------------------------
  echo Simulation script finished successfully.
  echo ----------------------------------------------------
) else (
  echo ----------------------------------------------------
  echo VIVADO FAILED with error code: %errorlevel%
  echo Please check for a 'vivado.log' file in this directory for more details.
  echo ----------------------------------------------------
)

REM Final pause to see the output
pause