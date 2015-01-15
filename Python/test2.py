# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import NoAlertPresentException
import unittest, time, re

class Test2(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Firefox()
        self.driver.implicitly_wait(30)
        self.base_url = "http://juba.scba.gov.ar/"
        self.verificationErrors = []
        self.accept_next_alert = True
    
    def test_2(self):
        driver = self.driver
        driver.get(self.base_url + "/Busquedas.aspx")
        driver.find_element_by_id("lnkTesauro").click()
        # ERROR: Caught exception [ERROR: Unsupported command [waitForPopUp | Tesauro | 30000]]
        # ERROR: Caught exception [ERROR: Unsupported command [selectWindow | name=Tesauro | ]]
        driver.find_element_by_id("txtBuscadorVoz").clear()
        driver.find_element_by_id("txtBuscadorVoz").send_keys("inconstitucionalidad")
        driver.find_element_by_id("lnkFiltrar").click()
        driver.find_element_by_id("lnkAgregarCompuesta").click()
        # ERROR: Caught exception [ERROR: Unsupported command [selectWindow | null | ]]
        driver.find_element_by_id("btnRealizarBusqueda").click()
        driver.find_element_by_link_text("Ver el Texto Completo del Fallo").click()
    
    def is_element_present(self, how, what):
        try: self.driver.find_element(by=how, value=what)
        except NoSuchElementException, e: return False
        return True
    
    def is_alert_present(self):
        try: self.driver.switch_to_alert()
        except NoAlertPresentException, e: return False
        return True
    
    def close_alert_and_get_its_text(self):
        try:
            alert = self.driver.switch_to_alert()
            alert_text = alert.text
            if self.accept_next_alert:
                alert.accept()
            else:
                alert.dismiss()
            return alert_text
        finally: self.accept_next_alert = True
    
    def tearDown(self):
        self.driver.quit()
        self.assertEqual([], self.verificationErrors)

if __name__ == "__main__":
    unittest.main()
