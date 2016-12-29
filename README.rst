simple-pageobject
=================

Overview
--------

This is a super lightweight page object library. 
The library could be used with any python test framework, including e.g robotframework


Source code
-----------

This project is inspired from original source code.

Original source code is hosted on github at the following url:

::

    [https://github.com/boakley/robotframework-pageobjectlibrary.git]

This package is even simpler

This package can be run using any python test framework. However, installation of robotframework is necessary
Reason: The package uses robotframework-api as a utility when used with other test framework.

Running the demo
----------------

In the github repository is a small demonstration suite that includes a
self-contained webserver and web site.

For the demo to run you must have robotframework 2.9+ and
ExtendedSelenium2Library installed. 

To run the demo, clone the github repository, cd to the folder that
contains this file, and then run the following command to be used along robot framework:

naviage to folder where demo3.robot available
run the following command
::

    $ pybot demo3.robot


How it works
------------

An instance of Selenium2Library is cached and the instance is made available in all the pages

Why page objects makes writing tests easier 
-------------------------------------------

Page object segregates locators from the code


An example page object: Look for details in pageobject.py
----------------------

A page object representing a login page might look like this:

::

    class LoginPage(PageObject):
        PAGE_TITLE = "Login - PageObjectLibrary Demo"
        PAGE_URL = "/login.html"

        _locators = {
            "username": "id=id_username",
            "password": "id=id_password",
            "submit_button": "id=id_submit",
        }

        def enter_username(self, username):
            """Enter the given string into the username field"""
            self.se2lib.input_text(self.locator.username, username)

        def enter_password(self,password):
            """Enter the given string into the password field"""
            self.se2lib.input_text(self.locator.password, password)

        def click_the_submit_button(self):
            """Click the submit button, and wait for the page to reload"""
            with self._wait_for_page_refresh():
                self.se2lib.click_button(self.locator.submit_button)
