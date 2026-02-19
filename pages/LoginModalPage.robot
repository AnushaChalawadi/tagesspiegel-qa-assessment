*** Settings ***
Library     String

*** Variables ***
# In the Browser library, the >>> operator is used to pierce into another DOM context,
${MODAL_IFRAME}          iframe#modal-iframe
${REGISTER_TAB}          ${MODAL_IFRAME} >>> button#tab-register
${EMAIL_FIELD}           ${MODAL_IFRAME} >>> input#forms\\/formRegistration_email    
${FIRST_NAME_FIELD}      ${MODAL_IFRAME} >>> input#forms\\/formRegistration_forename  
${SURNAME_FIELD}         ${MODAL_IFRAME} >>> input#forms\\/formRegistration_surname  
${REGISTER_BUTTON}       ${MODAL_IFRAME} >>> button:has(span:text("Jetzt registrieren"))

*** Keywords ***
Switch To Registration Tab
    [Documentation]    This keyword clicks on the "Registrieren" tab to switch to the registration form.
    Wait For Elements State    ${REGISTER_TAB}    visible    timeout=15s
    Click    ${REGISTER_TAB}

Fill Registration Form 
    [Documentation]    This keyword fills the registration form with email, first name and surname. 
    [Arguments]    ${email}    ${first_name}    ${last_name}
    Wait For Elements State    ${EMAIL_FIELD}    visible    timeout=10s
    Fill Text    ${EMAIL_FIELD}            ${email}
    Fill Text    ${FIRST_NAME_FIELD}       ${first_name}
    Fill Text    ${SURNAME_FIELD}          ${last_name}

Submit Registration Form
    [Documentation]    This keyword clicks on the "Jetzt registrieren" button to submit the registration form.
    Wait For Elements State    ${REGISTER_BUTTON}    visible    timeout=15s
    Take Screenshot    before_submit.png
    Click    ${REGISTER_BUTTON}
    Take Screenshot    after_submit.png
