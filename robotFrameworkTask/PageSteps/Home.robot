*** Settings ***
Library         SeleniumLibrary
Variables       ../PageElements/Home.py


*** Variables ***
${CloseXpath}       ')]


*** Keywords ***
Add A New User
    [Arguments]    ${userNameInput}    ${userEmailInput}    ${userRoleInput}

    Wait Until Page Contains Element    id:${NewUserId}    timeout=20

    Press Keys    id:${NewUserId}    ${userNameInput}
    Press Keys    id:${NewUserMail}    ${userEmailInput}
    Press Keys    id:${NewUserRole}    ${userRoleInput}
    Click Element    ${AddUserButton}

Verify User Added
    [Arguments]    ${expectedUserName}    ${expectedUserEmail}    ${expectedUserRole}

    ${userNameXpath}    Set Variable    ${userData}${expectedUserName}${CloseXpath}
    ${userEmailXpath}    Set Variable    ${userData}${expectedUserEmail}${CloseXpath}
    ${userRoleXpath}    Set Variable    ${userData}${expectedUserRole}${CloseXpath}

    Wait Until Page Contains Element    ${userNameXpath}    30

    Page Should Contain Element
    ...    ${userNameXpath}
    ...    message= ${expectedUserName} User Is Not Addd.
    Page Should Contain Element    ${userEmailXpath}    message= ${userEmailXpath} User Is Not Addd.
    Page Should Contain Element    ${userRoleXpath}    message= ${userRoleXpath} User Is Not Addd.

Verify User Doesn't Exist
    [Arguments]    ${expectedUserName}    ${expectedUserEmail}    ${expectedUserRole}

    ${userNameXpath}    Set Variable    ${userData}${expectedUserName}${CloseXpath}
    ${userEmailXpath}    Set Variable    ${userData}${expectedUserEmail}${CloseXpath}
    ${userRoleXpath}    Set Variable    ${userData}${expectedUserRole}${CloseXpath}

    Wait Until Page Does Not Contain Element  ${userNameXpath}    30

    Page Should Not Contain Element
    ...    ${userNameXpath}
    ...    message= ${expectedUserName} User Is Not Deleted.
    Page Should Not Contain Element    ${userEmailXpath}    message= ${userEmailXpath} User Is Not Deleted.
    Page Should Not Contain Element    ${userRoleXpath}    message= ${userRoleXpath} User Is Not Deleted.
Delete An Existing User
    [Arguments]    ${userName}

    ${deleteUserButton}    Set Variable    ${userData}${userName}${CloseXpath}${DeleteButton}
    Wait Until Page Contains Element    ${deleteUserButton}    30
    Wait Until Element Is Enabled          ${deleteUserButton}    30
    Execute Javascript      window.scrollBy(0,200)
    Sleep  5s
    Click Element    ${deleteUserButton}

Edit User Data
    [Arguments]    ${userToBeEdited}    ${updatedUserName}    ${updatedUserEmail}    ${updatedUserRole}

    ${editUserButton}    Set Variable    ${userData}${userToBeEdited}${CloseXpath}${EditUserData}
    Execute Javascript      window.scrollBy(0,200)
    Sleep    1s
    Wait Until Page Contains Element    ${editUserButton}    30
    Click Element    ${editUserButton}
    Wait Until Page Contains Element    ${EditUserHeader}    30
    Sleep    3s
    Wait Until Element Is Enabled    ${EditUserName}
    Clear Element Text    ${EditUserName}
    Press Keys    ${EditUserName}    ${updatedUserName}
    Clear Element Text    ${EditUserMail}
    Press Keys    ${EditUserMail}    ${updatedUserEmail}
    Clear Element Text    ${EditUserRole}
    Press Keys    ${EditUserRole}    ${updatedUserRole}
    Wait Until Element Is Enabled    ${EditUserButton}
    Click Element    ${EditUser}