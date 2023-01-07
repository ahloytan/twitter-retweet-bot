# twitter-retweet-bot
 A simple bot (automation) used to retweet/unretweet NFT giveaway tweets from Twitter

# How to use 
 1. Open variables.py and fill up the necessary information (DRIVER, USER_DATA, PROFILE, TEXT, USER) according to what you want to require
 2. The executables are retweet.bat(to retweet) and unretweet.bat(to unretweet)
 3. Simply launch either of the .bat file by double clicking it, and copy-paste the link to the tweet (CTRL+C on browser, right click to paste when you open the terminal/command prompt) 


# Notes
 1. We're using Microsoft Edge as the browser to run the twitter bot. Hence, if you're using MS Edge as your primary browser, it will likely not work. A solution would either be change your primary browser to Google Chrome, Mozilla Firefox, etc. (easier) or change the code to launch in the 2 browser mentioned prevously (harder)
 2. Please download your Microsoft Edge driver here (https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/). Do also check if your Microsoft Edge browser matches the driver that you download. To check your MS Edge browser version, enter "edge://settings/help"
 This bot is still in its early stage and has some limitations, so do feel free to give feedback on bugs or what can be improved!
 3. When running this program, Microsoft Edge cannot be running in the background because it will cause an error like (msedge.exe is no longer running, so msedgedriver is assuming that msedge has crashed.). To resolve this issue, open "Task Manager", find the Microsoft Edge program that's running in the background processes and end it
 4. There are some edge cases that will cause this automation to not work (For example, if your comments are like 1 year ago in the comment section). I will be working on it to possibly find a solution!
 5. This automation is optimized for desktop use!
 6. Whether the program fails, 2 .html (log, report) and 1 .xml (output) file will be generated. Don't worry about it as it's generated to show you where and why the program has failed

# Installation
1. Navigate to the root of this folder (Should be something like "pathToDirectory/twitter-retweet-bot")
2. Open up command prompt and enter "pip install -r requirements.txt" to install all the necessary dependencies (for now it's just the robotframework-seleniumlibrary)

# Variables.py
1. For the "DRIVER" field, you should place your Microsoft Edge driver in the same folder where your Python is installed. If you have multiple versions installed, you will have to identify the version that's being used whether the program executes. (I believe you can verify this through checking your environment variables)
2. For the "USER DATA" field, your Microsoft Edge profile should be located in this directory "C:\Users\<Current-user>\AppData\Local\Microsoft\Edge\User Data\Default"
3. For the "USER" field, it should be your twitter handle without the "@"
