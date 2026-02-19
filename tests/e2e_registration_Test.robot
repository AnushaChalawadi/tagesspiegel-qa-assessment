*** Settings ***
Library         Browser
Library         String
Library         DateTime
Resource        ../pages/BasePage.robot
Resource        ../pages/HomePage.robot
Resource        ../resources/Email_helper.robot
Resource        ../pages/NewPasswordPage.robot
Resource        ../pages/LoginModalPage.robot
Resource        ../pages/AccountPage.robot
Variables       ../variables/common_variables.yaml
Variables       ../variables/user_data.yaml

Suite Setup    Open Tagesspiegel Application

*** Variables ***
${GMAIL_USER}             ${EMPTY}
${GMAIL_APP_PASSWORD}     ${EMPTY}

*** Test Cases ***
TC01 Verify that the user can navigate to the registration page
    [Documentation]    This test case verifies that the user can navigate to the registration page 
    ...    by clicking on the "Anmelden" button and then clicking on the "Register" tab.

    #Generate a unique email ID for registration
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${email_prefix}=    Evaluate    '${GMAIL_USER}'.split('@')[0]
    ${randon_email}=    Set Variable    ${email_prefix}+${timestamp}@gmail.com

    Click Anmelden Modal
    Switch To Registration Tab
    Fill Registration Form    ${randon_email}    ${vorname}    ${nachname}
    Submit Registration Form
    
    # # Step1: Click on "Anmelden" button
    # Click Anmelden Modal

    # # Step2: Choose "Register" tab in login modal
    # Switch To Registration Tab

    # # Step3: Fill the mandatory data in registration form 
    # Fill Registration Form    ${randon_email}    ${vorname}    ${nachname}

    # # Step4: Submit/Send the registration form
    # Submit Registration Form

    # Step5: Get the registration link from email and navigate to that link
    ${reg_link}=    Get Registration Link From Email    
    ...    ${randon_email}    ${GMAIL_USER}       ${GMAIL_APP_PASSWORD}    

    Log    Registration link received: ${reg_link}
    
    # Step6: Navigate to the registration link
    Go To    ${reg_link}

    # Step7: Verify that the user is on the password set 
    # page by checking the presence of the header "Passwort vergeben"
    Verify Password Set Page Is Open
    
    # Step8: Fill the new password form with a generated password and confirm it.
    Fill New Password Form
    Click On Submit Button
    Verify User is Logged In     ${vorname}   ${nachname}
    
    # # Step9: Click on the submit button to set the new password.
    # Click On Submit Button By Accepting Permissions
    
    # # Step10: Verify that the user is logged in by checking the presence of the user's name on the home page.
    # Verify User is Logged In     ${vorname}   ${nachname}
