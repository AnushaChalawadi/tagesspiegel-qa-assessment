*** Settings ***

*** Variables ***
${EMAIL_CONFIRMATION_MESSAGE}    xpath=//h4[normalize-space()='Jetzt Kundenkonto aktivieren']


*** Keywords ***
Verify Registration Confirmation Message
    Wait Until Element Is Visible    ${EMAIL_CONFIRMATION_MESSAGE}    20s
    Element Should Be Visible    ${EMAIL_CONFIRMATION_MESSAGE}
        