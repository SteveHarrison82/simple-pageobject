from loginpage_v2_using_composition import LoginPage
from robot.api import logger

if __name__ == '__main__':


    se = LoginPage()
    se.create_browser("Firefox")
    logger.console ("browser opened ...")
    hp = se.navigate_to("http://yahoo.com")
    logger.console ("navigated to yahoo sucessfully ...")
    hp.go_to_google()
    logger.console ("navigated to google successfully ...")