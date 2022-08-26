*** Settings ***

Resource    ./TestBase.robot
Resource    ../PageSteps/Home.robot
Variables    ../TestData/UserInformation.py

Test Setup       Login In App    ${BaseUrl}        ${LoginUserName}    ${LoginPassword}
Test Teardown      Close Session             ${user}




*** Test Cases ***

Verify A User Can Be Edited In Application 
    [Documentation]
    ...                    |Task Test|
    ...                        |26-Aug-2022|
    ...                    |Given Admin user Loged In App And A Added User|
    ...                |When admin user edit A user|
    ...                |Then User Should Be edited|

    GIVEN I Add New User In Application    ${user}    ${userEmail}    ${userRole} 
    WHEN I edit the user Details         ${user}    ${updatedUser}      ${updatedemail}         ${updatedRole}  
    THEN Verify user edited successfully   ${updatedUser}      ${updatedemail}         ${updatedRole}  

    
*** Keywords ***

I Add New User In Application 
    [Arguments]    ${username}        ${useremail}        ${userrole}
    Add A New User    ${username}        ${useremail}        ${userrole}

I edit the user Details
    [Arguments]        ${userToBeEdited}    ${updatedUserName}    ${updatedUserEmail}        ${updatedUserRole}
    Edit User Data        ${userToBeEdited}    ${updatedUserName}    ${updatedUserEmail}        ${updatedUserRole}


Verify user edited successfully
    [Arguments]    ${username}        ${useremail}        ${userrole}
    Verify User Added   ${username}        ${useremail}        ${userrole}


Close Session 
    [Arguments]        ${userName}
    Delete An Existing User        ${userName}
    Close Chrome Broswer