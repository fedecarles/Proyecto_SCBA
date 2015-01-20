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

def extract_materia(browser):
    materias = browser.find_elements_by_xpath('//*[@id>=1 or @id<=1032]/table/tbody/tr[2]/td[1]/p')
    return [materia.text for materia in materias]

def extract_sumID(browser):
    sumIDs = browser.find_elements_by_xpath('//*[@id>=1 or @id<=1032]/table/tbody/tr[2]/td[2]/p')
    return [sumID.text for sumID in sumIDs]

def extract_desc(browser):
    descs = browser.find_elements_by_xpath('//*[@id>=1 or @id<=1032]/table/tbody/tr[3]/td/p')
    return [desc.text for desc in descs]

def extract_sumario(browser):
    sumarios = browser.find_elements_by_xpath('//*[@id>=1 or @id<=1032]/table/tbody/tr[4]/td/p')
    return [sumario.text for sumario in sumarios]

def extract_ley(browser):
    leyes = browser.find_elements_by_xpath('//*[@id>=1 or @id<=1032]/table/tbody/tr[5]/td')
    return [ley.text for ley in leyes]

def extract_detalles(browser):
    detalles = browser.find_elements_by_xpath('//*[@id>=1 or @id<=1032]/table/tbody/tr[7]/td/p')
    return [detalle.text for detalle in detalles]

# Set the driver.
#browser = webdriver.Firefox()
browser = webdriver.PhantomJS("/home/federico/PhantomJS/phantomjs-1.9.8-linux-x86_64/bin/phantomjs")

# Go to the initial page, then find the search field, fill in the search term and submit.
browser.get("http://juba.scba.gov.ar/Busquedas.aspx")
browser.find_element_by_xpath("//*[@id='txtExpresionBusquedaIntegral']").send_keys("VozSimple:Inconstitucionalidad Y VozSimple:Declaracion")
browser.find_element_by_xpath("//*[@id='btnRealizarBusqueda']").click()
browser.implicitly_wait(3)

urls = []

# Loop over the result pages and get the urls.
for page in xrange(1, 52 ):
    print "Page %d" % page
    time.sleep(5)
    #element = WebDriverWait(browser, 5).until(EC.presence_of_element_located((By.XPATH, "//*")))
    browser.find_element_by_xpath("//*[@id='cphMainContent_lnkSiguiente']").click()
    data = extract_urls(browser)
    urls.append([data])
    print data
    print "-----"

# write csv file
with open("urls_fallos_inconst.txt", "wb") as f:
    writer = csv.writer(f, delimiter = ",")
    for row in [urls]:
        writer.writerows(urls)
