
@Echo OFF
ECHO Hello! This is the batch script to run the robot file that helps you join giveaways~
CD %cd%
set x=1

:runName
Set /P "URL=Enter tweet URL please: "
cmd /v:on /c echo(^^!URL^^! | findstr /r "^[&^\\/?%%*:|<>\.\"]*$^" > nul

for /f "tokens=1,2 delims= " %%a in ("%URL%") do (
    set Tweet=%%a

    echo."%%a" | findstr /C:"?" 1>nul

    if not errorlevel 1 (
        @REM ECHO "Contains Question Mark"
        for /f "tokens=1 delims=?" %%c in ("%Tweet%") do set "Tweet=%%c"
    )

    robot -v URL:%Tweet% -v ADD_TEXT:%%b retweet.robot
)

if not defined Tweet goto :end
if /I "%Tweet%" Equ "E" goto :end


set /a x+=1
goto :runName

:end
PAUSE