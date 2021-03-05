@echo off
setlocal ENABLEDELAYEDEXPANSION
chcp 65001 >nul
title Compress

SET student_number=109xxxxxx

choice /C:12 /N /M "Choose Type: 1) Assignment 2) Practice"
IF errorlevel 2 goto practice
IF errorlevel 1 goto assignment

:assignment
SET folder=Assignment\
SET type=a
goto input

:practice
SET folder=Practice\
SET type=p
goto input

:input
SET /p id="ID: "
IF '%id%'=='' goto input
IF NOT EXIST %folder%%id% echo Code hasn't been created yet^^! Skip.&& goto exit

:compress
REM copy temporary image to compress them
cd %folder%\%id%\
copy *.png src\

SET filename=%type%%id%_%student_number%

cd src\
7za a %filename%.zip *\*.java *.png
del /q *.png
move %filename%.zip ..

:exit
echo .
echo Press any key to exit.
pause > nul
endlocal