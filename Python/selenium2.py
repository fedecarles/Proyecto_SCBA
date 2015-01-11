import re
import mechanize
from selenium import webdriver
import time
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

from contextlib import closing
from selenium.webdriver import Firefox # pip install selenium

class GetPlaylist(object):

    def getTopSongs(self):
        print "woking Billboard"
        #browser = webdriver.PhantomJS("/home/federico/PhantomJS/phantomjs-1.9.8-linux-x86_64/bin/phantomjs")
        browser = webdriver.Firefox()
        browser.get("http://www.scba.gov.ar/jurisprudencia/Navbar.asp?Busca=Fallos+Completos&SearchString=Inconstitucionalidad")
        time.sleep(5)
        links = browser.find_elements_by_xpath('//*[contains(text(), "Completo")]')
        for link in links:
            print link.get_attribute("href")


myClassObject = GetPlaylist()

myClassObject.getTopSongs()

