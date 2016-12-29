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

naviage to folder where robot file available

run the following command
::

    $ pybot helloapp.robot

::

    $ pybot helloapp2.robot

::

    $ pybot helloapp3_using_composition.robot

How it works
------------

An instance of Selenium2Library is cached and the instance is made available in all the pages

Why other page objects libraries are so huge ?
------------

a. While initializing a page, loads of attributes in that page-object could be pre-populated
https://github.com/ncbi/robotframework-pageobjects

In the example of simple-pageobject I have provided, 
each class needs to properly initialize __init__ and this is a redundant code, that one has to write

b. managing the web-element based on sections of web-page could involve a broader support of the library as in
https://github.com/ncbi/robotframework-pageobjects

c. and much much more, will add once I could comprehend : ))




Why page objects makes writing tests easier 
-------------------------------------------

Page object segregates locators from the code


An example page object: Look for details in *.py. Here is an example of loginpage.py
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
