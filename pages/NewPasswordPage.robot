*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${PASSWORD_HEADER}    xpath=//h3[contains(normalize-space(),'Passwort vergeben')]
${NEW_PASSWORD_FIELD}    xpath=//input[@id="forms/formSetPassword_password"]
${CONFIRM_PASSWORD_FIELD}    xpath=//input[@id="forms/formSetPassword_password_confirmation"]
${SUBMIT_BUTTON}      xpath=//button[@type='submit'] | //input[@type='submit']  

*** Keywords ***
Verify Password Set Page Is Open
    [Documentation]    This keyword verifies that the user is on the password set page 
    ...    by checking the presence of the header "Passwort vergeben"
    Wait Until Element Is Visible    ${PASSWORD_HEADER}    ${WAIT_TIME_20SEC}

Fill New Password Form
    [Documentation]    This keyword fills the new password form with a generated password and confirms it

    #Password (min. 8 characters; for a strong password 
    # we also recommend at least one uppercase letter, 
    # one lowercase letter and special characters)

    #Generate a random password if not provided
    ${RANDOM_STRING}=    Generate Random String    4    [LETTERS]

    ${NEW_PASSWORD}=    Set Variable    Welcome@1${RANDOM_STRING}
    Input Text    ${NEW_PASSWORD_FIELD}    ${NEW_PASSWORD}
    Wait Until Element Is Visible    ${CONFIRM_PASSWORD_FIELD}    ${WAIT_TIME_10SEC}
    Input Text    ${CONFIRM_PASSWORD_FIELD}    ${NEW_PASSWORD}

Click On Submit Button By Accepting Permissions
    [Documentation]    This keyword clicks on the submit button to set the new password
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    ${WAIT_TIME_10SEC}
    Capture Page Screenshot    before_password_submit.png
    Click Element    ${SUBMIT_BUTTON}
    Capture Page Screenshot    after_password_submit.png
