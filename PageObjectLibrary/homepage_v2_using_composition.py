from pageobject import PageObject
from locatormap import LocatorMap


class HomePage ():

    """Keywords for the Home page of the demo app

    There are no keywords defined for this page. However, by
    creating this empty page object we can still use the
    PageObjectLibrary keywords "Go to page" and "The current
    page should be"
    """

    PAGE_TITLE = "Home - PageObjectLibrary Demo"
    PAGE_URL = "/"

    # these are accessible via dot notaton with self.locator
    # (eg: self.locator.username, etc)
    _locators = {
    }

    def __init__(self):
        self.po = PageObject()
        self.se2lib = self.po.se2lib
        self.locator = LocatorMap(getattr(self, "_locators", {}))
    
    def go_to_google(self):
        """Enter the given string into the username field"""
        self.se2lib.go_to("http://www.google.com")