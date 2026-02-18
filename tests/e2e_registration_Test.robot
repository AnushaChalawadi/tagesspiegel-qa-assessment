*** Settings ***
Library         SeleniumLibrary
Library         String
Library         DateTime
Resource        ../pages/BasePage.robot
Resource        ../pages/HomePage.robot
Resource        ../resources/Email.robot
Resource        ../pages/NewPasswordPage.robot
Resource        ../pages/LoginModalPage.robot

Suite Setup    Open Tagesspiegel Application

*** Variables ***
${GMAIL_USER}             ${EMPTY}
${GMAIL_APP_PASSWORD}     ${EMPTY}
# ${GMAIL_USER}     Johntestemail1792@gmail.com
# ${GMAIL_APP_PW}   cltkbtztbzkqmugq
# ${GMAIL_USER}        Johntestemail1792@gmail.com
# ${GMAIL_PASSWORD}    cltkbtztbzkqmugq
#cltk btzt bzkq mugq


#Johntestemail1792
#Welcome@01
*** Test Cases ***
TC01 Verify that the user can navigate to the registration page
    [Documentation]    This test case verifies that the user can navigate to the registration page 
    ...    by clicking on the "Anmelden" button and then clicking on the "Register" tab.

    #Generate a unique email ID for registration
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${email_prefix}=    Evaluate    '${GMAIL_USER}'.split('@')[0]
    ${randon_email}=    Set Variable    ${email_prefix}+${timestamp}@gmail.com

    # Step1: Click on "Anmelden" button
    Click Anmelden
    #Title Should Be    Anmelden - Der Tagesspiegel

    Switch To Registration Tab
    Fill Registration Form    ${randon_email}    John    Doew
    Submit Registration Form

#     # Step2: Click on "Register" tab
#     Click on Register Tab
#    # ${UNIQUE_EMAIL_ID}=    Fill Registration Form With Unique Data    FirstName    LastName    ${GMAIL_USER}    ${GMAIL_APP_PW}

#     # Step3: Fill the registration form with unique data and submit
#     #Registration link should be received in the email
#     ${registration_email}=    Fill Registration Form With Unique Data     
    
#     # Step4: Click on Submit button
#     Submit Registration Form
    
    # Step5: 
    #Get registration link from email
    ${reg_link}=    Get Registration Link From Email    
    ...    ${randon_email}    ${GMAIL_USER}       ${GMAIL_APP_PASSWORD}    

    Log    Registration link received: ${reg_link}

    Go To    ${reg_link}

    #Step6
    Verify Password Set Page Is Open

    Fill New Password Form
    
    Click On Submit Button By Accepting Permissions



   