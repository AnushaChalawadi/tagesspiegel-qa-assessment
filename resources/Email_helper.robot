*** Settings ***
Library    RPA.Email.ImapSmtp
Library    String
Library    Collections

*** Variables ***
${IMAP_SERVER}       imap.gmail.com
${IMAP_PORT}         993

*** Keywords ***
Get Registration Link From Email
    [Documentation]    This keyword retrieves the registration link from the 
    ...    latest email sent to the specified recipient

    [Arguments]    ${recipient_email}    ${gmail_user}    ${gmail_app_password}    

    #Authorize the IMAP Connection
    Authorize Imap
    ...    account=${gmail_user}    
    ...    password=${gmail_app_password}      
    ...    imap_server=${IMAP_SERVER}
    ...    imap_port=${IMAP_PORT}
                
    ${registration_link}=   Wait For Registration Email    ${recipient_email}

    RETURN    ${registration_link}

Wait For Registration Email
    [Documentation]    This keyword waits for the registration email to arrive in the inbox

    [Arguments]    ${recipient_email}
    # Wait until the registration email arrives and extract the link
    ${link}=    Wait Until Keyword Succeeds
    ...    3 min    
    ...    10 s    
    ...    Get Registration Link Once    ${recipient_email}

    RETURN    ${link}

Get Registration Link Once
    [Documentation]    This keyword retrieves the registration link 
    ...    from the latest email sent to the specified recipient without waiting
    
    [Arguments]    ${recipient_email}
    
    # Search for unseen emails with the specified subject criteria
    ${messages}=    List Messages    criterion=UNSEEN SUBJECT "tagesspiegel"

    Should Not Be Empty    ${messages}    No emails found for recipient: ${recipient_email}

    ${latest}=     Get From List    ${messages}    -1
    ${body}=       Set Variable    ${latest}[Body]
    # Extract the registration link from the email body
    ${link}=      Extract Registration Link From Email Body    ${body}

    RETURN    ${link}
        

Extract Registration Link From Email Body
    [Documentation]    This keyword extracts the registration link from the body of the latest email 
    ...    sent to the specified recipient.

    [Arguments]    ${body}
    # Use a regular expression to find all URLs in the email body
    ${links}=      Get Regexp Matches    ${body}    https?://[^\\s"'<>]+
    # Iterate through the found links and check if any of them is likely to be a registration link
    FOR    ${link}    IN    @{links}
        ${is_registration_link}=    Run Keyword And Return Status
        ...    Should Match Regexp    ${link}    (?i)(registr|confirm|verify|activate|token)
        IF    ${is_registration_link}
            Log    Registration link found: ${link}
            RETURN    ${link}
        END
    END
    # If no specific registration link is found, return the first link present
    ${length}=    Get Length    ${links}
    IF    ${length} > 0
        Log    No registration link found, but links were present. Returning the first link: ${links}[0]
        RETURN    ${links}[0]
    ELSE
        Fail    No links found in the email body for recipient: ${recipient_email}
    END
