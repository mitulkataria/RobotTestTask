*** Settings ***
Variables       ../PageElements/Login.py
Library         SeleniumLibrary


*** Keywords ***

# For Loggin Into Application Using Multiple User Id and Passwords
Login Into Application
    [Arguments]    ${userName}    ${password}

    Wait Until Element Is Visible    ${userNameField}    30

    Press Keys    ${userNameField}    ${userName}
    Press Keys    ${passwordField}    ${password}
    Click Element    ${LoginButton}
