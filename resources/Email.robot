*** Settings ***
Library    RPA.Email.ImapSmtp
Library    String
Library    Collections


*** Variables ***
${IMAP_SERVER}       imap.gmail.com
${iMAP_PORT}         993


*** Keywords ***
Get Registration Link From Email
    [Documentation]    This keyword retrieves the registration link from the 
    ...    latest email sent to the specified recipient.

    [Arguments]    ${recipient_email}    ${gmail_user}    ${gmail_password}    

    #Authorize the IMAP Connection
    Authorize Imap
    ...    account=${gmail_user}    
    ...    password=${gmail_password}      
    ...    imap_server=${IMAP_SERVER}
    ...    imap_port=${iMAP_PORT}

    Select Mailbox    INBOX
                
    ${registration_link}=   Wait For Registration Email    ${recipient_email}

    Close Mailbox
    RETURN    ${registration_link}

# This keyword will be retried until it succeeds or the timeout is reached
Wait For Registration Email
    [Documentation]    This keyword waits for the registration email to arrive in the inbox.

    [Arguments]    ${recipient_email}
    ${link}=    Wait Until Keyword Succeeds
    ...    2 min    
    ...    10 s    
    ...    Get Registration Link From Latest Email    ${recipient_email}

    RETURN    ${link}



#     ${messages}=    List Messages
# ...    criterion=UNSEEN SUBJECT "Tagesspiegel"

#     Should Not Be Empty    ${message}    No emails found for recipient: ${recipient_email}

Get Registration Link Once
    [Documentation]    This keyword retrieves the registration link 
    ...    from the latest email sent to the specified recipient without waiting.
    [Arguments]    ${recipient_email}

    ${messages}=    List Messages
    ...    criterion=UNSEEN SUBJECT "Tagesspiegel"

    Should Not Be Empty    ${messages}    No emails found for recipient: ${recipient_email}

    ${latest}=     Get From List    ${messages}    -1
    ${body}=       Set Variable    ${latest}[Body]

    ${link}=      Extract Registration Link From Email Body    ${body}

    RETURN    ${link}
        

Extract Registration Link From Email Body
    [Documentation]    This keyword extracts the registration link from the body of the latest email 
    ...    sent to the specified recipient.

    [Arguments]    ${body}
    ${links}=      Get Regexp Matches    ${body}    https?://[^\\s"'<>]+
    FOR    ${link}    IN    @{links}
        ${is_registration_link}=    Run Keyword And Return Status
        ...    Should Match    ${link}    .*(registration|set-password).*
        IF    'registration' in ${link} or 'set-password' in ${link}
            Log    Registration link found: ${link}
            RETURN    ${link}
        END
    END
    ${length}=    Get Length    ${links}
    IF    ${length} > 0
        Log    No registration link found, but links were present. Returning the first link: ${links}[0]
        RETURN    ${links}[0]
    ELSE
        Fail    No links found in the email body for recipient: ${recipient_email}
    END




    # [Arguments]    ${body}

    # ${message}=    List Messages    
    # ...    criteria=TO "${recipient_email}"
    # Should Not Be Empty    ${message}    No emails found for recipient: ${recipient_email}

    # ${latest}=     Get From List    ${message}    -1
    # ${body}=       Set Variable    ${latest}[Body]

    # ${links}=      Get Regexp Matches    ${body}    https?://[^\s]+    

    # Should Not Be Empty    ${links}    No links found in the email body for recipient: ${recipient_email}

    # RETURN   ${links}[0]    Registration link found: ${links}[0]

    # FOR    ${i}     IN RANGE    10
    #     ${emails}=    List Messages    SUBJECT=

    #     IF    ${count} > 0
    #         ${latest_email}=    Get From List    ${emails}    0
    #         ${body}=    Set Variable    ${latest_email}[body]

    #         ${Links}=    Get Regexp Matches    ${body}    https?://[^\s]+

    #         ${registration_link}=    Get From List    ${Links}    0

    #         Log    Registration link found: ${registration_link}
    #         RETURN    ${registration_link}
    #     END
    #     Sleep    5s
    # END
    # Fail    Registration email not received within the expected time frame. 