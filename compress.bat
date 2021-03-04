@echo off
setlocal ENABLEDELAYEDEXPANSION
chcp 65001 >nul
title Compress

choice /C:12 /N /M "Choose Type: 1) Assignment 2) Practice"
IF errorlevel 2 goto practice
IF errorlevel 1 goto assignment

:assignment
SET folder=Assignment\
SET filename=aX_109xxxxxx
goto input

:practice
SET folder=Practice\
SET filename=pX_109xxxxxx
goto input

:input
SET /p id="ID: "
IF '%id%'=='' goto input
IF NOT EXIST %folder%%id% echo Code hasn't been created yet^^! Skip.&& goto exit

:compress
REM copy temporary image to compress them
cd %folder%\%id%\
copy *.png src\

cd src\
7za a %filename:X=!id!%.zip *\*.java *.png
del /q *.png
move %filename:X=!id!%.zip ..

:exit
echo .
echo Press any key to exit.
pause > nul
endlocal