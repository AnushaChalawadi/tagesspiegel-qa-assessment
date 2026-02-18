# Tagesspiegel E2E Registration Automation Using Robot Framework

This project contains the e2e automation framework for testing user registration on tagesspiegel.de using the Page Object Model(POM) design pattern.

## Overview
Automated testing framework that covers the complete user registration flow including email verification, new password setup and login confirmation.

## Teck Stack
- Test Automation Framework - Robot Framework
- Browser Library - SeleniumLibrary
- RPA Framework - 
- Python
- Python

## Design Pattern
This frameowork implements Page Object Model(POM) design pattern:
- Page Objects (pages/) - Encapsulate page elements and actions for each web page
- Test Cases (tests/) - Business logic and test scenarios
- Resources (resources/) - Shared keywords, utilies and email helper
- Variables (variables/) - Environment specific settings

## Benefits of POM
- Improved code maintainability
- Reduced code duplication
- Easy to update when UI changes
- Better test readability

## Prerequistics
Before setting up the framework, ensure you have:
- Python
- pip
- Gmail Account with 2-step verification enabled
- Gmail App Password generated

## Project Structure

## Setup Instructions
### Step1:  Initial Setup
- Clone the repository
```
    git clone <repositoryName>
    cd <repositoryName>
```
### Step2: Manual Install Dependencies
```
    pip install robotframework
    pip install robotframework-seleniumlibrary
    pip install rpaframework
```
### Step3: Gmail Setup for Email Verification
- Create Gmail Account
- Enable 2-Step Verification
- Generate App Password
- Copy the 16-character password

### Step4: Environment Configuration
This framework supports multiple environments
ENVIRONMENTS:
  PROD:
    BASE_URL: "https://www.tagesspiegel.de/"
  STAGING:
    BASE_URL: "https://staging.tagesspiegel.de/"
  TEST1:
    BASE_URL: "https://test1.tagesspiegel.de/"

### Email Configuration 
- RPA.Email.ImapSmtp

## How to Run Tests
```
    robot -v ENV:<ENVIRONMENT> -v GMAIL_USER:<GMAIL_USERNAME> -v   GMAIL_APP_PASSWORD:<GMAIL_APP_PASSWORD> e2e_registration_Test.robot
```

## Test Scenario Covered
1. Open tagesspiegel.de -> Navigates to the tagesspiegel.de website based on the environment (prod/staging/test1)
2. Click ‘Anmelden’ link -> Click on Anmelden link on header to register
3. Choose ‘Regiestieren’ tab -> Select the registration tab in the login modal
4. Fill mandatory data -> Enter random email, first name, last name. 
5. Send registration form -> Submit the registration form
6. Get registration link from email -> Poll gmail inbox for confirmation email(using RPA.Email.ImapSmtp)
7. Open registration link -> Navigate to the confirmation link from gmail account
8. Provide passwords -> Fill in password and password confirmation fields
9. Send password form -> Submit the password setup form
10. Verify user is logged in -> Confirm successful login with new credentials

## Test Results
After test execution, results are automatically generated in the project directory

### Generated File
- report.html -> High-level test summary with pass/fail statistics and charts
- log.html -> Detailed execution log with timestamps, screenshots and debug info
- output.xml -> Machine-readable results