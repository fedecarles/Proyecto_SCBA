# -*- coding: utf-8 -*-
import sys
import scrapy

from scrapy.contrib.spiders import CrawlSpider
from scrapy.selector import Selector

reload(sys)
sys.setdefaultencoding('utf-8')

class MySpider(CrawlSpider):
    name = "SCBA"
    allowed_domains = ["scba.gov.ar"]
    start_urls = ["http://www.scba.gov.ar/busqueda/oop2/qfullhit.htw?CiWebHitsFile=/falloscompl/scba/2014/09-03/p116525.doc&CiRestriction=Inconstitucionalidad&CiBeginHilite=%3Cstrong+class=Hit%3E&CiEndHilite=%3C/strong%3E&CiUserParam3=/jurisprudencia/Navbar.asp&CiHiliteType=Full"]

    def parse(self,response):
        sel = Selector(response)
        texts = sel.xpath("//*[contains(@class, 'mini')]").extract()

        print texts

