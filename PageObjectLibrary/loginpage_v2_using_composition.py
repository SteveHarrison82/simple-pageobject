from pageobject import PageObject
from homepage import HomePage
from locatormap import LocatorMap
from robot.api import logger

class LoginPage():

    PAGE_TITLE = "Login - PageObjectLibrary Demo"
    PAGE_URL = "/login.html"

    # these are accessible via dot notaton with self.locator
    # (eg: self.locator.username, etc)


    _locators = {
        "username": "id=id_username",
        "password": "id=id_password",
        "submit_button": "id=id_submit",
    }

    def __init__(self):
        self.logger = logger
        self.po = PageObject()
        self.se2lib = self.po.se2lib
        self.locator = LocatorMap(getattr(self, "_locators", {}))

    def navigate_to(self, url):
        logger.console ("Navigating to %s".format(url))
        self.se2lib.go_to(url)
        if 'yahoo' in url:
            logger.console ("Navigating to homepage")
            return HomePage()

    def create_browser(self, browser_name):
        self.se2lib.create_webdriver(browser_name)
    
    def enter_username(self, username):
        """Enter the given string into the username field"""
        self.se2lib.input_text(self.locator.username, username)

    def enter_password(self, password):
        """Enter the given string into the password field"""
        self.se2lib.input_text(self.locator.password, password)

    def click_the_submit_button(self):
        """Click the submit button, and wait for the page to reload"""
        with self.po._wait_for_page_refresh():
            self.se2lib.click_button(self.locator.submit_button)
            return HomePage()