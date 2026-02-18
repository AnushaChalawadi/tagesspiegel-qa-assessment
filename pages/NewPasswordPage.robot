*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${PASSWORD_HEADER}    xpath=//h3[contains(normalize-space(),'Passwort vergeben')]
${NEW_PASSWORD_FIELD}    xpath=//input[@id="forms/formSetPassword_password"]
${CONFIRM_PASSWORD_FIELD}    xpath=//input[@id="forms/formSetPassword_password_confirmation"]
${SELECT_PERMISSION_CHECKBOX}    xpath=//input[@class="checkbox"]
${SUBMIT_BUTTON}    xpath=//button[@class="form-button"]
#xpath=//button[@type='submit'] | //input[@type='submit']

#//button[normalize-space()='Speichern']
*** Keywords ***
Verify Password Set Page Is Open
    [Documentation]    This keyword verifies that the user is on the password set page 
    ...    by checking the presence of the header "Passwort vergeben".
    Wait Until Element Is Visible    ${PASSWORD_HEADER}    20s

Fill New Password Form
    [Documentation]    This keyword fills the new password form with a generated password and confirms it.
   # [Arguments]    ${new_password}

    #Password (min. 8 characters; for a strong password 
    # we also recommend at least one uppercase letter, 
    # one lowercase letter and special characters)

    #Generate a random password if not provided
    ${RANDOM_STRING}=    Generate Random String    4    [LETTERS]

    ${NEW_PASSWORD}=    Set Variable    Welcome@${RANDOM_STRING}
    Input Text    ${NEW_PASSWORD_FIELD}    ${NEW_PASSWORD}
    Input Text    ${CONFIRM_PASSWORD_FIELD}    ${NEW_PASSWORD}

Click On Submit Button By Accepting Permissions
    [Documentation]    This keyword clicks on the submit button to set the new password.
    Click Element    ${SELECT_PERMISSION_CHECKBOX}
    Click Element    ${SUBMIT_BUTTON}
