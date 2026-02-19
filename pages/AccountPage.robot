*** Settings ***
Library     Browser

*** Variables ***
${ANMELDEN_LINK}       xpath=//a[@data-gtm-link-text='Anmelden']
${USER_NAME_HEADING}    css=h1.dashboard-heading__title

*** Keywords ***
Verify User Is Logged In
    [Documentation]    Verifies that the user is logged in by checking
    ...    absence of "Anmelden" link, presence of first name, last name,
    ...    and "Mein Konto"

    [Arguments]    ${first_name}    ${last_name}

    Wait For Load State    networkidle    timeout=10s
    Wait For Elements State    ${USER_NAME_HEADING}    visible    timeout=10s

    # Verify "Anmelden" model is NOT visible
    ${count}=    Get Element Count    ${ANMELDEN_LINK}
    Should Be Equal As Integers    ${count}    0

    # Capture Full name from heading
    ${full_name}=    Get Text    ${USER_NAME_HEADING}
    Log    Logged in user: ${full_name}

    # Validate both first and last name are present
    Should Contain    ${full_name}    ${first_name}
    Should Contain    ${full_name}    ${last_name}

    # Check for "Mein Konto"
    ${has_mein_konto}=    Run Keyword And Return Status
    ...    Get Text    text=Mein Konto
    IF    not ${has_mein_konto}
        Get Text    text=Mein Bereich
    END
    
    Take Screenshot    verified_logged_in_state.png
