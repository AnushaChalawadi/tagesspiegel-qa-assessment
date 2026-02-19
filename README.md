# Tagesspiegel E2E Registration Automation Using Robot Framework

## Overview
This project automates the end-to-end user registration flow on `tagesspiegel.de` using the Robot Framework and Page Object Model(POM) design pattern.

The Framework validates
- User Registration
- Email verification via Gmail
- Password setup
- Successful login confirmation

It is designed to be maintainable and scalable.

## Tech Stack
- Test Automation Framework : Robot Framework 7.4.1
- Browser Automation Library : SeleniumLibrary
- Email Automation : `RPA.Email.ImapSmtp` (rpaframework)
- Programming Language : Python 3.13.5 

## Design Pattern - Page Object Model(POM)
This framework implements Page Object Model(POM) design pattern:
- `pages/` Encapsulate page elements and actions for each web page
- `tests/` Business logic and test scenarios
- `resources/` Shared keywords, utilities and email helper
- `variables/` Environment-specific configuration

## Environment Configuration
This framework supports multiple environments

```yaml
  environments:
    prod:
      base_url: "https://www.tagesspiegel.de/"
    staging:
      base_url: "https://staging.tagesspiegel.de/"
    test1:
      base_url: "https://test1.tagesspiegel.de/"
```

## Supported Browsers
- Chrome
- Firefox

## Prerequisites
- Python 3.13.x and pip3 installed
- Gmail Account with 2-step verification enabled check [here](https://support.google.com/accounts/answer/185839) for instructions.
- Gmail App Password generated check [here](https://support.google.com/mail/answer/185833) for instructions.

## Project Structure
```
project_root
│
├── pages/
    ├── AccountPage.robot                   # Page Object Model files,
│   ├── BasePage.robot
│   ├── HomePage.robot
│   ├── LoginModalPage.robot
│   └── NewPasswordPage.robot
│
├── resources/                 # Reusable keywords & helpers
│   ├── Email_helper.robot
│
├── variables/                 # Environment & configuration files
│   ├── environments.yaml
│   └── common_variables.yaml
│
├── tests/                     # Test cases
│   └── e2e_registration_Test.robot
│
├── results/                   # Auto-generated execution reports
│   ├── report.html
│   ├── log.html
│   ├── output.xml
│   └── screenshots/
│
├── requirements.txt           # Python dependencies
├── README.md                  # Project documentation
└── .gitignore                 # Ignored files (venv, results, etc.)
```

## Setup Instructions
### Step1: Clone Repository
```
    git clone https://github.com/AnushaChalawadi/tagesspiegel-qa-assessment
    cd tagesspiegel-qa-assessment
```
### Step2: Install Dependencies
It is recommended to use a requirements.txt file:
```
  pip install -r requirement.txt
```
### Step3: Gmail Setup for Email Verification
- Create A temporary Gmail Account
- Enable 2-Step Verification
- Generate App Password
- Copy the 16-character password
Note: Do not use your personal gmail, create a temporary one

## How to Run Tests
```
  robot -d results \
      -v ENV:PROD \
      -v GMAIL_USER:your_email@gmail.com \
      -v GMAIL_APP_PASSWORD:your_app_password \
      tests/e2e_registration_Test.robot

```

## Test Scenarios Covered
1. Open tagesspiegel.de : Navigates to the tagesspiegel.de website based on the environment (prod/staging/test1)
2. Click ‘Anmelden’ link : Click on Anmelden link on header to register
3. Choose ‘Regiestieren’ tab : Select the registration tab in the login modal
4. Fill mandatory data : Enter random email, first name, last name. 
5. Send registration form : Submit the registration form
6. Get registration link from email : Poll gmail inbox for confirmation email(using RPA.Email.ImapSmtp)
7. Open registration link : Navigate to the confirmation link from gmail account
8. Provide passwords : Fill in password and password confirmation fields
9. Send password form : Submit the password setup form
10. Verify user is logged in : Confirm successful login with new credentials

## Test Results
After test execution, results are automatically generated and saved in the `results/` directory
- report.html : High-level test summary with pass/fail statistics
- log.html : Detailed execution log with timestamps, screenshots and debug info
- output.xml : Machine-readable results


