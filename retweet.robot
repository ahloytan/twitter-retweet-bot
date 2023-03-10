*** Settings ***
Documentation     Simple twitter bot to join NFT giveaways
...               https://stackoverflow.com/questions/51414605/how-to-pass-command-line-arguments-test-data-parameters-in-robot-framework      
Library           OperatingSystem 
Library           SeleniumLibrary
Variables         variables.py


*** Variables ***
${URL}      https://www.twitter.com

*** Test Cases ***
Start Bot
    Open Browser To Twitter

*** Keywords ***
Open Browser To Twitter

    #https://stackoverflow.com/questions/71238056/msedge-failed-to-start-crashed-chrome-not-reachable
    ${options}     Evaluate      sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --executable_path\=${DRIVER}
    Call Method    ${options}    add_argument    --allow-running-insecure-content
    Call Method    ${options}    add_argument    --disable-web-security
    Call Method    ${options}    add_argument    --user-data-dir\=${USER_DATA}
    Call Method    ${options}    add_argument    --profile-directory\=${PROFILE}
    Open Browser   ${URL}        Edge            options=${options}    
                                           
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article                                             15s
                                           
    Scroll Element Into View         xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[7]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[7]/div/div[3]            15s
    Click Element                    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[7]/div/div[3]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[7]/div/div[2]            15s
    Click Element                    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[7]/div/div[2]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]/div/div/div/div                                                           15s
    Click Element                    xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]/div/div/div/div
    Scroll Element Into View         xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/div/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/div/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div[1]/div/div/div/div/div/label/div[1]/div/div/div/div                              15s
    Click Element                    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/div/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div[1]/div/div/div/div/div/label/div[1]/div/div/div/div
    Input Text                       xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/div/div/div[2]/div[2]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div/label/div[1]/div/div/div/div/div/div/div/div/div/div/span    ${TEXT}
    Press Keys                       xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/div/div/div[2]/div[2]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div/label/div[1]/div/div/div/div/div/div/div/div/div/div/span    TAB
    Wait Until Element Is Enabled    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/div/div/div[2]/div[2]/div/div/div/div[2]/div[3]/div/div/div[2]/div[2]                                                                                15s    
    Click Element                    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/div/div/div[2]/div[2]/div/div/div/div[2]/div[3]/div/div/div[2]/div[2]

    Sleep    1750ms
    [Teardown]        Close Browser
