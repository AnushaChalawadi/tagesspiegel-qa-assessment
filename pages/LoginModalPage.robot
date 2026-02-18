*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
#${ANMELDEN_LINK}       xpath=//a[@data-gtm-link-text='Anmelden']
${MODAL_IFRAME}        id=modal-iframe
${REGISTER_TAB}        xpath=//button[@id='tab-register']
${EMAIL_FIELD}         xpath=//input[@id="forms/formRegistration_email"]
${FIRST_NAME_FIELD}    xpath=//input[@id="forms/formRegistration_forename"]
${SURNAME_FIELD}       xpath=//input[@id="forms/formRegistration_surname"]
${REGISTER_BUTTON}     xpath=//button[.//span[normalize-space()='Jetzt registrieren']]
${BASE_EMAILID}        johntestemail1792@gmail.com

*** Keywords ***
Switch To Login Iframe
    Wait Until Element Is Visible    ${MODAL_IFRAME}    20s
    Select Frame    ${MODAL_IFRAME}
    Wait Until Element Is Visible    ${REGISTER_TAB}    20s

Switch To Registration Tab
    Switch To Login Iframe
    Wait Until Element Is Visible    ${REGISTER_TAB}    20s
    Click Element    ${REGISTER_TAB}

Fill Registration Form 
    [Documentation]    This keyword fills the registration form with email, first name and surname. 

    [Arguments]    ${email}    ${first_name}    ${last_name}
    Wait Until Element Is Visible    ${EMAIL_FIELD}    20s
    Input Text    ${EMAIL_FIELD}            ${email}
    Input Text    ${FIRST_NAME_FIELD}       ${first_name}
    Input Text    ${SURNAME_FIELD}          ${last_name}

Submit Registration Form
    [Documentation]    This keyword clicks on the "Jetzt registrieren" button to submit the registration form.
    Wait Until Element Is Visible    ${REGISTER_BUTTON}    20s
    Capture Page Screenshot    before_submit.png
    Click Element    ${REGISTER_BUTTON}
    Capture Page Screenshot    after_submit.png
    

    # [Documentation]    This keyword fills the registration form with email, first name and surname. 

    # [Arguments]    ${email}    ${first_name}    ${last_name}   
    # ${RANDOM_STRING}=    Generate Random String    4    [LETTERS]

    # ${FIRST_NAME}=    Set Variable    User_${RANDOM_STRING}

    # ${LAST_NAME}=     Set Variable    Test_${RANDOM_STRING}

    # ${UNIQUE_EMAIL_ID}=      Set Variable    johntestemail1792+${RANDOM_STRING}@gmail.com


    # #Fill the registration form with generated data
    # Input Text    ${FIRST_NAME_FIELD}       ${FIRST_NAME}
    # Input Text    ${SURNAME_FIELD}          ${LAST_NAME}
    # Input Text    ${EMAIL_FIELD}            ${UNIQUE_EMAIL_ID}

    # RETURN    ${UNIQUE_EMAIL_ID}
    # Wait Until Element Is Visible    ${REGISTER_BUTTON}    20s


