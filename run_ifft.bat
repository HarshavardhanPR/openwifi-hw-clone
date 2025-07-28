@echo off
REM ============================================================================
REM Final Batch Script to Run the 8-Point IFFT Simulation
REM This script will save all output to a file named 'ifft_log.txt'
REM ============================================================================

REM IMPORTANT: Make sure this path is correct for your PC
set VIVADO_PATH=D:\Apps\Vivado\Application\Vivado\2024.2

echo --- Starting Vivado IFFT Simulation ---
echo --- All output will be saved to ifft_log.txt ---

REM Set up the Vivado environment
call %VIVADO_PATH%\settings64.bat

REM Execute the Tcl script specifically for the IFFT and log the output
vivado -mode batch -source simulate_ifft.tcl > ifft_log.txt 2>&1

echo.
echo --- IFFT Simulation Finished. ---
echo --- Please open the file 'ifft_log.txt' to see the results. ---
pause
