*** Settings ***
|
| Library   | pageobject.PageObject
| Library   | loginpage.LoginPage
| Library   | homepage.HomePage
|
| Suite Setup | Start webapp and open browser
| Suite Teardown | Stop webapp and close all browsers

*** Variables ***
| ${BROWSER} | chrome

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
| | Close all browsers

| Start webapp and open browser
| | start process | python | ${CONFIG.demo_root}/webapp/demoserver.py
