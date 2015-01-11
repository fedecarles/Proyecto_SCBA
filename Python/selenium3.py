import re
import mechanize
from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

from contextlib import closing
from selenium.webdriver import Firefox # pip install selenium


browser = webdriver.Firefox()
browser.get("http://www.scba.gov.ar/jurisprudencia/Navbar.asp?Busca=Fallos+Completos&SearchString=Inconstitucionalidad")
time.sleep(5)

elements = browser.find_element_by_xpath('//a[contains(text(),"Completo")]')

for element in elements:
    print(element.get_attribute("href"))
    browser.find_element_by_xpath("//td[2]/a").click() # Click on next button
    time.sleep(5)


