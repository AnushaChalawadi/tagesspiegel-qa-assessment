*** Settings ***
Library     SeleniumLibrary
Resource    CookiesBanner.robot

*** Variables ***
${BASE_URL}    https://www.tagesspiegel.de/

*** Keywords ***
Open Tagesspiegel Application
    Open Browser    ${BASE_URL}    Chrome   
    Maximize Browser Window
    Accept Cookies If Present

