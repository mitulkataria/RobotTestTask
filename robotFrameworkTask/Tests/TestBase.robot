*** Settings ***
Library     SeleniumLibrary

Resource    ../PageSteps/Login.robot

*** Variables ***
${CHROME_BROWSER}        chrome

*** Keywords ***
Login In App
    [Arguments]    ${url}        ${UserName}        ${password}
    Open Browser    ${url}    ${CHROME_BROWSER} 
    Maximize Browser Window
    Login Into Application         ${UserName}       ${password}
Close Chrome Broswer
    Close Browser 

