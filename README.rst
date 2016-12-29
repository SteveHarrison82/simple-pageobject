PageObjectLibrary
=================

Overview
--------

PageObjectLibrary is a lightweight `robot
framework <http://www.robotframework.org>`__ keyword library that makes
it possible to use the page object pattern when testing web pages with
the keyword based approach of robot framework.


Source code
-----------

This project is inspired from original source code.

Original source code is hosted on github at the following url:

::

    [https://github.com/boakley/robotframework-pageobjectlibrary.git]

This package is even simpler    

Running the demo
----------------

In the github repository is a small demonstration suite that includes a
self-contained webserver and web site.

For the demo to run you must have robotframework 2.9+ and
Selenium2Library installed. You must also have cloned the github
repository to have access to the demo files.

To run the demo, clone the github repository, cd to the folder that
contains this file, and then run the following command:

naviage to folder where demo3.robot available
run the following command
::

    $ pybot demo3.robot


How it works
------------

An instance of Selenium2Library is cached and the instance is made available in all the pages

Why page objects makes writing tests easier
-------------------------------------------

The purpose of the page object pattern is to encapsulate the knowledge
of how a web page is constructed into an object. Your test uses the
object as an interface to the application, isolating your test cases
from the details of the implementation of a page.

With page objects, developers are free to modify web pages as much as
they want, and the only thing they need to do to keep existing tests
from failing is to update the page object class. Because test cases
aren't directly tied to the implementation, they become more stable and
more resistent to change as the website matures.



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
