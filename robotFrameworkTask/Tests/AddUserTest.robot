*** Settings ***

Resource    ./TestBase.robot
Resource    ../PageSteps/Home.robot
Variables    ../TestData/UserInformation.py

Test Setup       Login In App    ${BaseUrl}        ${LoginUserName}    ${LoginPassword}
Test Teardown      Close Session             ${user}


*** Test Cases ***

Verify A New User Added In Application 
    [Documentation]
    ...                    |Task Test|
    ...                        |26-Aug-2022|
    ...                    |Given Admin user Loged In App|
    ...                |When admin user Add A New user|
    ...                |Then User Should Be Added|

    WHEN I Add New User In Application    ${user}    ${userEmail}    ${userRole} 
    THEN Verify user added successfully     ${user}    ${userEmail}    ${userRole} 

*** Keywords ***

I Add New User In Application 
    [Arguments]    ${username}        ${useremail}        ${userrole}
    Add A New User    ${username}        ${useremail}        ${userrole}

Verify user added successfully
    [Arguments]    ${username}        ${useremail}        ${userrole}
    Verify User Added   ${username}        ${useremail}        ${userrole}


Close Session 
    [Arguments]        ${userName}
    Delete An Existing User        ${userName}
    Close Chrome Broswer