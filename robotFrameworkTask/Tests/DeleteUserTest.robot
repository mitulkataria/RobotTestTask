*** Settings ***

Resource    ./TestBase.robot
Resource    ../PageSteps/Home.robot
Variables    ../TestData/UserInformation.py

Test Setup       Login In App    ${BaseUrl}        ${LoginUserName}    ${LoginPassword}
Test Teardown      Close Session          


*** Test Cases ***

Verify A User Can Be Deleted In Application 
    [Documentation]
    ...                    |Task Test|
    ...                        |26-Aug-2022|
    ...                    |Given Admin user Loged In App And A Added User|
    ...                |When admin user edit A user|
    ...                |Then User Should Be edited|

    GIVEN I Add New User In Application    ${user}    ${userEmail}    ${userRole} 
    WHEN I delete the user          ${user}    
    THEN Verify user deleted successfully       ${user}    ${userEmail}    ${userRole} 
    
*** Keywords ***

I Add New User In Application 
    [Arguments]    ${username}        ${useremail}        ${userrole}
    Add A New User    ${username}        ${useremail}        ${userrole}

I delete the user  
    [Arguments]        ${userToDelete}    
   Delete An Existing User      ${userToDelete}    

Verify user deleted successfully 
   [Arguments]    ${username}        ${useremail}        ${userrole}
   Verify User Doesn't Exist     ${username}        ${useremail}        ${userrole}

Close Session 
     Close Chrome Broswer