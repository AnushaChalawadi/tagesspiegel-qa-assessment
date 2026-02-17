*** Settings ***
Library    Browser

*** Test Cases ***
Open Google
    New Browser    chromium    headless=False
    New Page    https://google.com
