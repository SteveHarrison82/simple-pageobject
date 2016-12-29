from pageobject import PageObject
from loginpage_v2_using_composition import LoginPage
from homepage_v2_using_composition import HomePage

if __name__ == "__main__":
    se = LoginPage()
    se.create_browser("Firefox")
    hp = se.navigate_to("http://yahoo.com")
    hp.go_to_google()