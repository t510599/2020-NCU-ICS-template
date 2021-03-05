@echo off
setlocal ENABLEDELAYEDEXPANSION
chcp 65001 >nul

:setup
SET student_number=109xxxxxx

choice /C:12 /N /M "Choose Type: 1) Assignment 2) Practice"
IF errorlevel 2 goto practice
IF errorlevel 1 goto assignment

:assignment
SET folder=Assignment\
SET type=a
goto ask

:practice
SET folder=Practice\
SET type=p
goto ask

:ask
SET /p id="ID: "
IF '%id%'=='' goto ask
IF EXIST %folder%%id% echo Code has already done^^! Skip.&& goto exit
SET /p files="Files: "
IF '%files%'=='' SET files=1

:copy
robocopy /E /NC /NS /NP /NJH /NJS template-project\ %folder%%id%\
cd %folder%%id%\
REM replace X in .project
FOR /F "delims=" %%l in (.project) DO (
    SET line=%%l
    echo !line:XX=%type%%id%!>>.tmp
)
del /q .project
move .tmp .project >nul

SET filename=%type%%id%_%student_number%

IF NOT %files%==1 (
    FOR /L %%i in (1 1 %files%) DO (
        SET pn=%filename%_%%i

        mkdir src\!pn!\

        REM replace X in file
        FOR /F "delims=" %%l in (Solution.java) DO (
            SET line=%%l

            REM Replace delay expansion with delay expansion 
            REM https://stackoverflow.com/a/41537179/9039813
            for /F "delims=" %%S in (^""X=!pn!"^") do (
                set line=!line:%%~S!
            )
            echo !line!>>src\!pn!\Solution.java
        )
    )
) ELSE (
    mkdir src\%filename%\

    REM replace X in file
    FOR /F "delims=" %%l in (Solution.java) DO (
        SET line=%%l
        echo !line:X=%filename%!>>src\%filename%\Solution.java
    )
)

REM template cleanup
del /q Solution.java

:exit
echo.
echo Press any key to exit.
pause > nul
endlocal