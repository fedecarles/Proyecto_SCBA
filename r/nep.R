library(RCurl)
library(XML)

############### DIPUTADOS ##################

urls.dip <- c("http://andytow.com/atlas/totalpais/buenosaires/1995dp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/1997dp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/1999dp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2001dp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2003dp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2005dp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2007dp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2009dp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2011dp.html")

scrape.dip <- lapply(urls.dip, function(x) getURL(x, userpwd="atlaselectoral:atlaselectoral", httpauth = 1L))

tables.dip <- lapply(scrape.dip,readHTMLTable)
tables.dip <- sapply(tables.dip,"[",3)

tables.dip <- lapply(tables.dip, setNames , nm = c("partido", "votos", "por", "cargos"))
tables.dip <- lapply(tables.dip, function(x) x[-1:-3,])
tables.dip <- lapply(tables.dip,function(x) x[!x$partido %in% c("VOTOS POSITIVOS","VOTOS EN BLANCO",
                                             "VOTOS ANULADOS","TOTAL VOTANTES","TOTALES",
                                             "VOTOS BLANCOS","VOTOS NULOS"),])

### Cálculo de NEP por votos ### 
votos.dip <- sapply(tables.dip, "[", 2)
votos.dip <- lapply(votos.dip, function(x) as.numeric(gsub("\\.","",x)))
coc.votos.dip <- lapply(votos.dip, function(x) x/sum(x))
nep.votos.dip <- lapply(coc.dip, function(x) 1/sum(x^2))

### Cálculo de NEP por Bancas ###
bancas.dip <- sapply(tables.dip, "[", 4)
bancas.dip <- lapply(bancas.dip, function(x) as.numeric(as.character(x)))
coc.bancas.dip <- lapply(bancas.dip, function(x) x/sum(x, na.rm = TRUE))
nep.bancas.dip <- lapply(coc.bancas.dip, function(x) 1/sum(x^2, na.rm = TRUE))

### Hay que repetir el proceso para los datos de 2013 porque estan guardados de manera diferente ###
urls.dip.13 <- c("http://andytow.com/atlas/totalpais/buenosaires/consultalp.php?cod=6&anio=2013&cat=1&tipo=1",
		  "http://andytow.com/atlas/totalpais/buenosaires/consultalp.php?cod=2&anio=2013&cat=1&tipo=1",
		  "http://andytow.com/atlas/totalpais/buenosaires/consultalp.php?cod=3&anio=2013&cat=1&tipo=1",
		  "http://andytow.com/atlas/totalpais/buenosaires/consultalp.php?cod=8&anio=2013&cat=1&tipo=1")
scrape.dip.13 <- lapply(urls.dip.13, function(x) getURL(x, userpwd="atlaselectoral:atlaselectoral", httpauth = 1L))

tables.dip.13 <- lapply(scrape.dip.13,readHTMLTable)
tables.dip.13 <- sapply(tables.dip.13,"[",3)

tables.dip.13 <- lapply(tables.dip.13, setNames , nm = c("partido", "votos", "por", "cargos"))
tables.dip.13 <- lapply(tables.dip.13, function(x) x[-1:-3,])
tables.dip.13 <- lapply(tables.dip.13,function(x) x[!x$partido %in% c("VOTOS POSITIVOS","VOTOS EN BLANCO",
                                             "VOTOS ANULADOS","TOTAL VOTANTES","TOTALES",
                                             "VOTOS BLANCOS","VOTOS NULOS"),])
votos.dip.13 <- sapply(tables.dip.13, "[", 2)
votos.dip.13 <- lapply(votos.dip.13, function(x) as.numeric(gsub("\\.","",x)))
coc.votos.dip.13 <- lapply(votos.dip.13, function(x) x/sum(x))
nep.votos.dip.13 <- lapply(coc.votos.dip.13, function(x) 1/sum(x^2))
nep.votos.dip.13 <- mean(unlist(nep.votos.dip.13))

bancas.dip.13 <- sapply(tables.dip.13, "[", 4)
bancas.dip.13 <- lapply(bancas.dip.13, function(x) as.numeric(as.character(x)))
coc.bancas.dip.13 <- lapply(bancas.dip.13, function(x) x/sum(x, na.rm = TRUE))
nep.bancas.dip.13 <- lapply(coc.bancas.dip.13, function(x) 1/sum(x^2, na.rm = TRUE))
nep.bancas.dip.13 <- mean(unlist(nep.bancas.dip.13))

NEP.VOTOS.DIP <- c(unlist(nep.votos.dip),unlist(nep.votos.dip.13))
names(NEP.VOTOS.DIP) <- c("1995","1997","1999","2001","2003","2005","2007","2009","2011","2013")

NEP.BANCAS.DIP <- c(unlist(nep.bancas.dip),unlist(nep.bancas.dip.13))
names(NEP.BANCAS.DIP) <- c("1995","1997","1999","2001","2003","2005","2007","2009","2011","2013")

############### SENADORES ##################

urls.sen <- c("http://andytow.com/atlas/totalpais/buenosaires/1995sp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/1997sp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/1999sp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2001sp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2003sp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2005sp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2007sp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2009sp.html",
         "http://andytow.com/atlas/totalpais/buenosaires/2011sp.html")

scrape.sen <- lapply(urls.sen, function(x) getURL(x, userpwd="atlaselectoral:atlaselectoral", httpauth = 1L))

tables.sen <- lapply(scrape.sen,readHTMLTable)
tables.sen <- sapply(tables.sen,"[",3)

tables.sen <- lapply(tables.sen, setNames , nm = c("partido", "votos", "por", "cargos"))
tables.sen <- lapply(tables.sen, function(x) x[-1:-3,])
tables.sen <- lapply(tables.sen, function(x) x[x$partido != "",])
tables.sen <- lapply(tables.sen,function(x) x[!x$partido %in% c("VOTOS POSITIVOS","VOTOS EN BLANCO",
                                             "VOTOS ANULADOS","TOTAL VOTANTES","TOTALES",
                                             "VOTOS BLANCOS","VOTOS NULOS"),])

### Cálculo de NEP por votos ### 
votos.sen <- sapply(tables.sen, "[", 2)
votos.sen <- lapply(votos.sen, function(x) as.numeric(gsub("\\.","",x)))
coc.votos.sen <- lapply(votos.sen, function(x) x/sum(x))
nep.votos.sen <- lapply(coc.sen, function(x) 1/sum(x^2))

### Cálculo de NEP por bancas ### 
bancas.sen <- sapply(tables.sen, "[", 4)
bancas.sen <- lapply(bancas.sen, function(x) as.numeric(as.character(x)))
coc.bancas.sen <- lapply(bancas.sen, function(x) x/sum(x))
nep.bancas.sen <- lapply(coc.sen, function(x) 1/sum(x^2))

urls.sen.13 <- c("http://andytow.com/atlas/totalpais/buenosaires/consultalp.php?cod=4&anio=2013&cat=2&tipo=1",
		 "http://andytow.com/atlas/totalpais/buenosaires/consultalp.php?cod=7&anio=2013&cat=2&tipo=1",
		 "http://andytow.com/atlas/totalpais/buenosaires/consultalp.php?cod=5&anio=2013&cat=2&tipo=1",
		 "http://andytow.com/atlas/totalpais/buenosaires/consultalp.php?cod=1&anio=2013&cat=2&tipo=1")

scrape.sen.13 <- lapply(urls.sen.13, function(x) getURL(x, userpwd="atlaselectoral:atlaselectoral", httpauth = 1L))

tables.sen.13 <- lapply(scrape.sen.13,readHTMLTable)
tables.sen.13 <- sapply(tables.sen.13,"[",3)

tables.sen.13 <- lapply(tables.sen.13, setNames , nm = c("partido", "votos", "por", "cargos"))
tables.sen.13 <- lapply(tables.sen.13, function(x) x[-1:-3,])
tables.sen.13 <- lapply(tables.sen.13,function(x) x[!x$partido %in% c("VOTOS POSITIVOS","VOTOS EN BLANCO",
                                             "VOTOS ANULADOS","TOTAL VOTANTES","TOTALES",
                                             "VOTOS BLANCOS","VOTOS NULOS"),])

votos.sen.13 <- sapply(tables.sen.13, "[", 2)
votos.sen.13 <- lapply(votos.sen.13, function(x) as.numeric(gsub("\\.","",x)))
coc.votos.sen.13 <- lapply(votos.sen.13, function(x) x/sum(x))
nep.votos.sen.13 <- lapply(coc.sen.13, function(x) 1/sum(x^2))
nep.votos.sen.13 <- mean(unlist(nep.sen.13))

bancas.sen.13 <- sapply(tables.sen.13, "[", 4)
bancas.sen.13 <- lapply(bancas.sen.13, function(x) as.numeric(as.character(x)))
coc.bancas.sen.13 <- lapply(bancas.sen.13, function(x) x/sum(x, na.rm = TRUE))
nep.bancas.sen.13 <- lapply(coc.bancas.sen.13, function(x) 1/sum(x^2, na.rm = TRUE))
nep.bancas.sen.13 <- mean(unlist(nep.bancas.sen.13))

NEP.VOTOS.SEN <- c(unlist(nep.sen),unlist(nep.sen.13))
names(NEP.VOTOS.SEN) <- c("1995","1997","1999","2001","2003","2005","2007","2009","2011","2013")

NEP.BANCAS.SEN <- c(unlist(nep.bancas.sen),unlist(nep.bancas.sen.13))
names(NEP.BANCAS.SEN) <- c("1995","1997","1999","2001","2003","2005","2007","2009","2011","2013")

nep <- cbind(NEP.VOTOS.DIP,NEP.BANCAS.DIP,NEP.VOTOS.SEN,NEP.BANCAS.SEN) 
write.csv(nep, file="NEP.1995-2013.csv")
