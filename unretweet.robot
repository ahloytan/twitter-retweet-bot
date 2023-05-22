*** Settings ***
Documentation     Simple twitter bot to unretweet
Library           OperatingSystem 
Library           SeleniumLibrary    run_on_failure=None   
Variables         variables.py

*** Variables ***
${URL}      https://www.twitter.com

*** Test Cases ***
Start Bot
    Open Browser To Twitter

*** Keywords ***
Open Browser To Twitter
    ${options}     Evaluate      sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --executable_path\=${DRIVER}
    Call Method    ${options}    add_argument    --allow-running-insecure-content
    Call Method    ${options}    add_argument    --disable-web-security
    Call Method    ${options}    add_argument    --user-data-dir\=${USER_DATA}
    Call Method    ${options}    add_argument    --profile-directory\=${PROFILE}
    Open Browser   ${URL}        Edge            options=${options}    

    Wait Until Element Is Visible          xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article                                     15s                      
    Scroll Element Into View               xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[6]
    
    #Like Button
    Click Element                          xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[6]/div/div[3]
    Wait Until Element Is Visible          xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[6]/div/div[2]    15s
    
    #Retweet Button
    Click Element                          xpath=/html/body/div[1]/div/div/div[2]/main/div/div/div/div[1]/div/section/div/div/div[1]/div/div/article/div/div/div[3]/div[6]/div/div[2]
    Wait Until Element Is Visible          xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]                                                                   15s
    Wait Until Element Is Visible          xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]/div/div/div/div                                                   15s
    Click Element                          xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]/div/div/div/div
    Wait Until Element Is Not Visible      xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]/div/div                                                           15s           
    
    # Comment
    ${isCommentVisible}                    Run Keyword And Return Status                                  Element Should Be Visible                                                      xpath=//a[@href="/${USER}"]//div//div[1]//span//span
    IF    ${isCommentVisible} 
        Scroll Element Into View                 xpath=//a[@href="/${USER}"]//div//div[1]//span//span   
    ELSE
        ${scrollY}                                Set Variable                                            1000     
        WHILE    not ${isCommentVisible}    limit=20
            Execute Javascript                   window.scrollTo(0, ${scrollY})
            Sleep                                1000ms
            ${isCommentVisible}                  Run Keyword And Return Status                            Element Should Be Visible                                                      xpath=//a[@href="/${USER}"]//div//div[1]//span//span 
            ${scrollY}                           Evaluate                                                 ${scrollY}+1000
        END
    END
    Click Element At Coordinates           xpath=//a[@href="/${USER}"]//div//div[1]//span//span                                                                                          450    0
    Wait Until Element Is Visible          xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]/div/div/div/div[1]                                                15s
    Click Element                          xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div[2]/div/div[3]/div/div/div/div[1]
    Wait Until Element Is Visible          xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]                                                 15s
    Click Element                          xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]
    Wait Until Element Is Not Visible      xpath=/html/body/div[1]/div/div/div[1]/div[2]/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]                                                 15s
    
    Sleep    1250ms
    [Teardown]        Close Browser