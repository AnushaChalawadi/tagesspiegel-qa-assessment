*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${ANMELDEN_LINK}    xpath=//a[@data-gtm-link-text='Anmelden']

*** Keywords ***
Verify User is Logged In
    [Documentation]    This keyword verifies that the user is logged in by checking 
    ...    the presence of the "My Account" header, URL, First Name and Last Name

    [Arguments]    ${first_name}    ${last_name}
    Sleep    3s     reason=Wait for the page to load after login
    Capture Page Screenshot    verify_logged_in_state.png
    Page Should Not Contain Element    ${ANMELDEN_LINK}

    Page Should Contain    ${first_name}
    Page Should Contain    ${last_name}
    ${has_mein_konto}=    Run Keyword And Return Status
    ...    Page Should Contain    Mein Konto
    IF    not ${has_mein_konto}
        Page Should Contain    Mein Bereich
    END

Close Test Browser
    [Documentation]    Closes all browser windows opened during the test
    Close All Browsers