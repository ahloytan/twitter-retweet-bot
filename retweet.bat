
@Echo OFF
ECHO Hello! This is the batch script to run the robot file that helps you join giveaways~
CD %cd%
set x=1

:runName
Set /P "URL=Enter tweet URL please: "
cmd /v:on /c echo(^^!URL^^! | findstr /r "^[&^\\/?%%*:|<>\.\"]*$^" > nul

@REM https://stackoverflow.com/questions/13805187/how-to-set-a-variable-inside-a-loop-for-f
for /F "tokens=1,2 delims= " %%a in ("%URL%") do (
    echo."%%a" | findstr /C:"?" 1>nul
    set "processedURL=%%a"
    if not errorlevel 1 (
        ECHO "Contains Question Mark"
        SETLOCAL ENABLEDELAYEDEXPANSION
        for /F "tokens=1 delims=?" %%c in ("%%a") do set "processedURL=%%c"
    )

    robot -v URL:%processedURL% -v ADD_TEXT:%%b retweet.robot
)

@REM if not defined %URL% goto :end
@REM if /I "%URL%" Equ "E" goto :end


set /a x+=1
goto :runName

:end
PAUSE