@Echo OFF
ECHO Hello! This is the batch script to run the robot file that helps you unretweet
CD %cd%
set x=1

:runName
Set "URL="
Set /P URL="Enter tweet URL please: "

if not defined URL goto :end
if /I "%URL%" Equ "E" goto :end

(
for %%a in (%URL%) do (
    robot --variable URL:%URL% unretweet.robot
    )
)
set /a x+=1
goto :runName

:end
echo Press Any Keys To Close
PAUSE