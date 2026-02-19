*** Settings ***
Library     Browser

*** Variables ***
${PASSWORD_HEADER}    xpath=//h3[contains(normalize-space(),'Passwort vergeben')]
${NEW_PASSWORD_FIELD}    xpath=//input[@id="forms/formSetPassword_password"]
${CONFIRM_PASSWORD_FIELD}    xpath=//input[@id="forms/formSetPassword_password_confirmation"]
${SUBMIT_BUTTON}      xpath=//button[@type='submit']   

*** Keywords ***
Verify Password Set Page Is Open
    [Documentation]    This keyword verifies that the user is on the password set page 
    ...    by checking the presence of the header "Passwort vergeben"
    Wait For Elements State    ${PASSWORD_HEADER}    visible    timeout=20s

Fill New Password Form
    [Documentation]    This keyword fills the new password form with a generated password and confirms it

    #Password (min. 8 characters; for a strong password 
    # we also recommend at least one uppercase letter, 
    # one lowercase letter and special characters)

    # Generate a password 
    ${RANDOM_STRING}=    Generate Random String    4    [LETTERS]
    ${NEW_PASSWORD}=     Set Variable    Welcome@1${RANDOM_STRING}

    # Wait until password field is visible and fill it
    Wait For Elements State    ${NEW_PASSWORD_FIELD}    visible    timeout=10s
    Fill Text    ${NEW_PASSWORD_FIELD}    ${NEW_PASSWORD}

    # Wait until confirm password field is visible and fill it
    Wait For Elements State    ${CONFIRM_PASSWORD_FIELD}    visible    timeout=10s
    Fill Text    ${CONFIRM_PASSWORD_FIELD}    ${NEW_PASSWORD}

Click On Submit Button
    [Documentation]    This keyword clicks on the submit button to set the new password
    Wait For Elements State    ${SUBMIT_BUTTON}    visible    timeout=10s
    Take Screenshot    before_password_submit.png
    Click    ${SUBMIT_BUTTON}
    Take Screenshot    after_password_submit.png
    Sleep    2s    reason=Wait for password form submission to process
    
