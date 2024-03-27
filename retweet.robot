*** Settings ***
Documentation     Simple twitter bot to join NFT giveaways
...               https://stackoverflow.com/questions/51414605/how-to-pass-command-line-arguments-test-data-parameters-in-robot-framework      
Library           OperatingSystem 
Library           SeleniumLibrary    run_on_failure=None
Variables         variables.py

*** Variables ***
${URL}         https://www.twitter.com
${ADD_TEXT}    ${EMPTY}

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

                                           
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article                                                                             5s
    #Like           
    Scroll Element Into View         xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[5]/div/div/div[3]/div/div/div[1]               
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[5]/div/div/div[3]/div/div/div[1]                         5s
    Click Element                    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[5]/div/div/div[3]/div/div/div[1]
    #Retweet
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[5]/div/div/div[2]/div/div/div[1]                         5s                                   
    Click Element                    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[5]/div/div/div[2]/div/div/div[1]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]/div/div/div/div                                                                                           5s
    Click Element                    xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]/div/div/div/div                                                                                   
    
    # Comment                                       
    Scroll Element Into View         xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[5]/div/div[1]/div/div/div[1]
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[5]/div/div[1]/div/div/div[1]                              5s
    Click Element                    xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[5]/div/div[1]/div/div/div[1]
    
    # Comment Modal
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]                                                                                                        5s
    Input Text                       xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div/div[3]/div[2]/div[2]/div/div/div/div[1]/div[2]/div/div/div/div/div/div/div/div/div/div/div/label/div[1]/div/div/div/div/div/div/div/div/div/div/span/span       ${TEXT} ${ADD_TEXT}    
                                           
    ${hasHashTag}                    Evaluate    "#" in "${ADD_TEXT}"

    IF    '${ADD_TEXT}' != '${EMPTY}' and ${hasHashTag}
        Press Keys    None    ESC
    END    

    Wait Until Element Is Enabled    xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div/div[3]/div[2]/div[2]/div/div/div/div[2]/div[2]/div/div/div                                 5s    
    Click Element                    xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div/div[3]/div[2]/div[2]/div/div/div/div[2]/div[2]/div/div/div
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div                                                                                                                          5s

    # [Teardown]        Close Browser
