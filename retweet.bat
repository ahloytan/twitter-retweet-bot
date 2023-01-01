
@Echo OFF
ECHO Hello! This is the batch script to run the robot file that helps you join giveaways~
CD %cd%
set x=1

:runName
Set /P "URL=Enter tweet URL please: "
cmd /v:on /c echo(^^!URL^^! | findstr /r "^[&^\\/?%%*:|<>\.\"]*$^" > nul

IF %errorlevel% NEQ 0 ( 
    for /f "tokens=1 delims=?" %%a in ("%URL%") do set "URL=%%a"
)


if not defined URL goto :end
if /I "%URL%" Equ "E" goto :end

(
for %%a in (%URL%) do (
    robot --variable URL:%URL% retweet.robot
    )
)
set /a x+=1
goto :runName

:end
PAUSE