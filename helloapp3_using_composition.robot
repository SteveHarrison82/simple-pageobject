*** Settings ***
| Variables | ./PageObjectLibrary/resources/config.py          # not used anywhere. Considering variables just for demo
|
| Library   | PageObjectLibrary.PageObject
| Library   | PageObjectLibrary.LP
| Library   | PageObjectLibrary.HP
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
| | Close All Browsers             




| Start webapp and open browser
| | start process | python | ./PageObjectLibrary/webapp/demoserver.py
