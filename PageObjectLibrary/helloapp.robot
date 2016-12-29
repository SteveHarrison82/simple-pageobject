*** Settings ***
| Variables | ./resources/config.py          # not used anywhere. Considering variables just for demo
|
| Library   | pageobject.PageObject
| Library   | loginpage.LoginPage
| Library   | homepage.HomePage
| Library   | Process
|
| Suite Setup | Start webapp and open browser
| Suite Teardown | Stop webapp and close all browsers


*** Variables ***
| ${BROWSER} | Chrome

*** Test Cases ***

| Login with valid credentials
| | [Setup] |  Create Browser | ${BROWSER}
| | Navigate To | http://localhost:8000/login.html
| | Enter username | Demo User
| | Enter password | password
| | Click the submit button
| | Go to google

*** Keywords ***
| Stop webapp and close all browsers
| | Terminate all processes
| | pageobject.PageObject.Close All Browsers             
# when libraries are built using compostion, we dont have to do this ugly thing:
# pageobject.PageObject.Close All Browsers 



| Start webapp and open browser
| | start process | python | ./webapp/demoserver.py
