*** Settings ***
| # this is the only place where we have to hard-code a path;
| # when config.py is loaded it will alter the path to include
| # the resources folder.
| Variables | ../resources/config.py
|
| Library   | pageobject.PageObject
| Library   | loginpage.LoginPage
| Library   | homepage.HomePage
|
#| Suite Setup | Start webapp and open browser
#| Suite Teardown | Stop webapp and close all browsers

*** Variables ***
| ${BROWSER} | chrome

*** Keywords ***
| Stop webapp and close all browsers
| | Terminate all processes
| | Close all browsers

| Start webapp and open browser
| | start process | python | ${CONFIG.demo_root}/webapp/demoserver.py
#| | open browser | ${CONFIG.root_url} | ${BROWSER}

*** Test Cases ***

| Login with valid credentials
| | [Setup] |  Create Browser | Ie
| | Navigate To | http://localhost:8000/login.html
| | Enter username | Demo User
| | Enter password | password
| | Click the submit button
| | Go to google
#| | The current page should be | HomePage

# | Login with invalid credentials
# | | [Setup] | Go to page | LoginPage
# | | Enter username | Demo User
# | | Enter password | bogus password
# | | Click the submit button
# | | The current page should be | LoginPage
