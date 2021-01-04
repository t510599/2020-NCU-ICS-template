@echo off
setlocal ENABLEDELAYEDEXPANSION
chcp 65001 >nul

:setup
choice /C:12 /N /M "Choose Type: 1) Assignment 2) Practice"
IF errorlevel 2 goto practice
IF errorlevel 1 goto assignment

:setext
choice /C:12 /N /M "Choose File Type: 1) Python 2) CPP"
IF errorlevel 2 goto cpp
IF errorlevel 1 goto python

:assignment
SET folder=Assignment\
SET filename=AX-109xxxxxx
goto setext

:practice
SET folder=Practice\
SET filename=PX-109xxxxxx
goto setext

:python
SET ext=py
goto ask

:cpp
SET ext=cpp
goto ask

:ask
SET /p id="ID: "
IF '%id%'=='' goto ask
IF EXIST %folder%%id% echo Code has already done^^! Skip.&& goto exit
SET /p files="Files: "
IF '%files%'=='' SET files=1

:copy
mkdir %folder%%id%

IF NOT %files%==1 (
    FOR /L %%i in (1 1 %files%) DO (
        SET fn=%folder%%id%\%filename:X=!id!%-%%i.%ext%
        REM replace X in file
        FOR /F "delims=" %%l in (%folder%%filename%.%ext%) DO (
            SET line=%%l
            SET newline=!line:X=%id%-%%i!
            echo !newline!>>!fn!
        )
    )
) ELSE (
    SET fn=%folder%%id%\%filename:X=!id!%.%ext%
    REM replace X in file
    FOR /F "delims=" %%l in (%folder%%filename%.%ext%) DO (
        SET line=%%l
        echo !line:X=%id%!>>!fn!
    )
)

:exit
echo.
echo Press any key to exit.
pause > nul
endlocal