*** Settings ***
Library    RPA.Email.ImapSmtp
#Library    SeleniumLibrary
Library    String
Library    Collections


*** Variables ***
${GMAIL_USER}        Johntestemail1792@gmail.com
${GMAIL_PASSWORD}    cltkbtztbzkqmugq
${IMAP_SERVER}       imap.gmail.com


*** Keywords ***
Get Registration Link From Email
    [Arguments]    ${recipient_email}
    Authorize Imap
    ...       account=${GMAIL_USER}    
    ...       password=${GMAIL_PASSWORD}      
    ...       imap_server=${IMAP_SERVER} 

    ${registration_link}=    Wait Until Keyword Succeeds    1 min    5 sec    Get Registration Link From Latest Email    ${recipient_email}
    RETURN    ${registration_link}

Extract Registration Link From Email Body
    [Arguments]    ${recipient_email}

    ${message}=    List Messages    
    ...    criteria=TO "${recipient_email}"
    Should Not Be Empty    ${message}    No emails found for recipient: ${recipient_email}

    ${latest}=     Get From List    ${message}    -1
    ${body}=       Set Variable    ${latest}[Body]

    ${links}=      Get Regexp Matches    ${body}    https?://[^\s]+    

    Should Not Be Empty    ${links}    No links found in the email body for recipient: ${recipient_email}

    RETURN   ${links}[0]    Registration link found: ${links}[0]

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