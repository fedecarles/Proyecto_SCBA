import re
import csv

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def extract_data(browser):
    #links = browser.find_elements_by_xpath('//i[@class="RecordStats"]/a') # link a los archivos word
    links = browser.find_elements_by_xpath('//a[contains(text(),"Completo")]')
    return [link.get_attribute('href') for link in links]

#browser = webdriver.Firefox()
browser = webdriver.PhantomJS("/home/federico/PhantomJS/phantomjs-1.9.8-linux-x86_64/bin/phantomjs")
browser.get("http://www.scba.gov.ar/jurisprudencia/Navbar.asp?Busca=Fallos+Completos&SearchString=Inconstitucionalidad")

# get max pages
element = WebDriverWait(browser, 10).until(EC.presence_of_element_located((By.XPATH, "//p[@class='c'][last()]")))
print element.text
max_pages = int(re.search(r'\d+ de (\d+)', element.text).group(1), re.UNICODE)

# extract from the current (1) page
print extract_data(browser)

urls = []
# loop over the rest of the pages
for page in xrange(1, 1910 ):
    print "Page %d" % page

    next_page = browser.find_element_by_xpath("//table[last()]//td[last()]/a").click()

    data = extract_data(browser)
    data = [item.replace('%2F', '/').replace('%2D', '-').replace('%2E', '.').replace('%3D', '=').replace("javascript:void(window.open('../..","http://www.scba.gov.ar").replace("Documento%20completo','toolbar=no,menubar=no,scrollbars=yes,resizable=yes,top=0,left=0,width=600,height=300'))","") for item in data]
    urls.append([data])

    print data
    print "-----"

# write csv file
with open("urls_fallos.txt", "wb") as f:
    writer = csv.writer(f, delimiter = ",")
    for row in [urls]:
        writer.writerows(urls)
