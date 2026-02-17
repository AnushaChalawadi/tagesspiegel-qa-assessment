*** Settings ***
Library     SeleniumLibrary
Library    String

*** Variables ***
${ANMELDEN_LINK}    xpath=//a[@data-gtm-link-text='Anmelden']
${MODAL_IFRAME}         id=modal-iframe
${REGISTER_TAB}         xpath=//button[@id='tab-register']
${EMAIL_FIELD}         xpath=//input[@id="forms/formRegistration_email"]
${FIRST_NAME_FIELD}    xpath=//input[@id="forms/formRegistration_forename"]
${SURNAME_FIELD}       xpath=//input[@id="forms/formRegistration_surname"]
${REGISTER_BUTTON}     xpath=//button[.//span[normalize-space()='Jetzt registrieren']]
${BASE_EMAILID}     johntestemail1792@gmail.com

*** Keywords ***
# Fill Registration Form With Unique Data
#     [Arguments]    ${first_name}    ${last_name}   
#     ${RANDOM_STRING}=    Generate Random String    4    [LETTERS]
#     ${FIRST_NAME}=    Set Variable    User_${RANDOM_STRING}
#     Log    The value of the variable is ${FIRST_NAME}
#     ${LAST_NAME}=     Set Variable    Test_${RANDOM_STRING}
#     Log    The value of the variable is ${LAST_NAME}
#     ${UNIQUE_EMAIL_ID}=      Set Variable    johntestemail1792+${RANDOM_STRING}@gmail.com
#     Log    The value of the variable is ${UNIQUE_EMAIL_ID}
#     #Fill the registration form with generated data
#     Input Text    ${FIRST_NAME_FIELD}       ${FIRST_NAME}
#     Input Text    ${SURNAME_FIELD}          ${LAST_NAME}
#     Input Text    ${EMAIL_FIELD}            ${UNIQUE_EMAIL_ID}

#     RETURN    ${UNIQUE_EMAIL_ID}
#     Wait Until Element Is Visible    ${REGISTER_BUTTON}    20s

Submit Registration Form
    Click Element    ${REGISTER_BUTTON}