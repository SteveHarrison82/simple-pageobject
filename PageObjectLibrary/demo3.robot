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
| Suite Setup | Start webapp and open browser
| Suite Teardown | Stop webapp and close all browsers

*** Variables ***
| ${BROWSER} | chrome

*** Keywords ***
| Stop webapp and close all browsers
| | Terminate all processes
| | Close all browsers

| Start webapp and open browser
| | start process | python | ${CONFIG.demo_root}/webapp/demoserver.py

*** Test Cases ***

| Login with valid credentials
| | [Setup] |  Create Browser | Ie
| | Navigate To | http://localhost:8000/login.html
| | Enter username | Demo User
| | Enter password | password
| | Click the submit button
| | Go to google
