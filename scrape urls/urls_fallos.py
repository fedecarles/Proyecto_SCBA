# -*- coding: utf-8 -*-
import re
import csv
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def extract_urls(browser):
    links = browser.find_elements_by_xpath('//*[@id>=1 or @id<=1032]/table/tbody/tr[7]/td/p/a')
    return [link.get_attribute('href') for link in links]

# Inicializar el webdriver. Descomentar Firefox para usar ese browser. PhantomJS es un driver que opera sin entorno gráfico. 
browser = webdriver.Firefox()
#browser = webdriver.PhantomJS("/home/federico/PhantomJS/phantomjs-1.9.8-linux-x86_64/bin/phantomjs")

# Ir a la página inicial de JUBA y realizar la búsqueda de fallos por voz simple de inconstitucionalidad. 
browser.get("http://juba.scba.gov.ar/Busquedas.aspx")
browser.find_element_by_xpath("//*[@id='txtExpresionBusquedaIntegral']").send_keys("TribunalEmisor:SCBALP Y TipoFallo:Definitiva Y FechaDesdeFallo:01/10/2014 Y FechaHastaFallo:31/12/2014")
browser.find_element_by_xpath("//*[@id='btnRealizarBusqueda']").click()
browser.implicitly_wait(3)

# Crear el contenedor vacío donde guardar las urls.
urls = []

# Para todas las páginas de resultados de la búsqueda guardar el link de los fallos completos. 
for page in xrange(1,72):
    print "Page %d" % page
    time.sleep(5)
    #element = WebDriverWait(browser, 5).until(EC.presence_of_element_located((By.XPATH, "//*")))
    browser.find_element_by_xpath("//*[@id='cphMainContent_lnkSiguiente']").click()
    data = extract_urls(browser)
    urls.append([data])
    print data
    print "-----"

# Escribir un archivo txt con las urls.
with open("urls_2014c.txt", "wb") as f:
    writer = csv.writer(f, delimiter = ",")
    for row in [urls]:
        writer.writerows(urls)
