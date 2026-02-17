*** Settings ***
Resource    ../pages/BasePage.robot
Resource    ../pages/HomePage.robot
Resource    ../resources/Email.robot
#Resource    ../resources/Registration.robot

Suite Setup    Open Tagesspiegel Application

*** Variables ***
${GMAIL_USER}     Johntestemail1792@gmail.com
${GMAIL_APP_PW}   cltkbtztbzkqmugq
#cltk btzt bzkq mugq



#Johntestemail1792
#Welcome@01
*** Test Cases ***
TC01 Verify that the user can navigate to the registration page
    Click Anmelden
    #Title Should Be    Anmelden - Der Tagesspiegel
    Click on Register Tab
   # ${UNIQUE_EMAIL_ID}=    Fill Registration Form With Unique Data    FirstName    LastName    ${GMAIL_USER}    ${GMAIL_APP_PW}


    #Registration link should be received in the email
    ${registration_email}=    Fill Registration Form With Unique Data     

    Submit Registration Form

    ${link}=    Get Registration Link From Email    ${registration_email}

    Log    Registration link received: ${link}

    Go To    ${link}

   