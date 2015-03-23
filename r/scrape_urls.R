# File-Name:       Corpus_Fallos_Inconst.R
# Date:            Enero 2015
# Author:          Federico Carlés
# Email:           fedecarles@mail.utdt.edu                                      
# Data:            www.scba.gov.ar
# Packages Used:   XML, RCurl,  stringr
# R version        3.1.2 (2014-10-31)
# System           Linux Mint 17 (Qiana)
# Encoding         UTF-8

# Librerias utilizadas
library(XML)
library(RCurl)
library(stringr)
library(tm)
#### SCRAPING DE LOS FALLOS DE JUBA ####

# Carga del archivo csv con las urls de los fallos.
urls <- read.table("~federico/Documents/Proyecto_SCBA/Python/urls_raw/urls_raw.txt",sep=",")
urls <- unique(t(urls))
urls <- gsub("\\s|\\[|\\]","",urls)
urls <- urls[urls != ""]

# Parsing del contenido de las urls.
scraped_raw  <- sapply(urls[1:500], function(x) getURLContent(x,verbose=TRUE,timeout=300))
scraped_raw2  <- sapply(urls[501:1000], function(x) getURLContent(x,verbose=TRUE,timeout=300))
scraped_raw3  <- sapply(urls[1001:1500], function(x) getURLContent(x,verbose=TRUE,timeout=300))
scraped_raw4  <- sapply(urls[1501:2000], function(x) getURLContent(x,verbose=TRUE,timeout=300))
scraped_raw5  <- sapply(urls[2001:2500], function(x) getURLContent(x,verbose=TRUE,timeout=300))
scraped_raw6  <- sapply(urls[2501:2690], function(x) getURLContent(x,verbose=TRUE,timeout=300))
scraped_all <- c(scraped_raw,scraped_raw2,scraped_raw3,scraped_raw4,scraped_raw5,scraped_raw6)

# Contenedores vaciós de los datos claves a extraer.
materia <- list()
tipo <- list()
trib_emisor <- list()
causa <- list()
fecha <- list()
caratula <- list()
magistrados <- list()
trib_origen <- list()
texto <- list()

# Extracción de los datos usando el identificador xpath. El xpath para extraer el texto de los fallos en  windows es "//table[2]//tr[2]//td[1]//table[4]".
for (i in scraped_all){
	materia[i] <- xpathSApply(htmlParse(i),"//*[@id='lblMateria']", xmlValue) 
	tipo[i] <- xpathSApply(htmlParse(i),"//*[@id='lblTipoDeFallo']", xmlValue) 
	trib_emisor[i]  <- xpathSApply(htmlParse(i),"//*[@id='lblTribunalEmisor']", xmlValue)  
	causa[i]  <- xpathSApply(htmlParse(i),"//*[@id='lblCausa']", xmlValue)  
	fecha[i]  <- xpathSApply(htmlParse(i),"//*[@id='lblFecha']", xmlValue) 
	caratula[i]  <- xpathSApply(htmlParse(i),"//*[@id='lblCaratula']", xmlValue)  
	magistrados[i]  <- xpathSApply(htmlParse(i),"//*[@id='lblmagistradosVotantes']", xmlValue)  
	trib_origen[i]  <- xpathSApply(htmlParse(i),"//*[@id='lblTribunalOrigen']", xmlValue)  
	texto[i] <- xpathSApply(htmlParse(i),"//table[2]", xmlValue)  
}

#### PROCESAMIENTO DE LOS DATOS CRUDOS ####

# Construcción del data frame con los detalles de los fallos. El texto de los fallos se guarda separadamente.
df_materia <- data.frame(as.character(materia))
df_tipo <- data.frame(as.character(tipo))
df_trib_emisor <- data.frame(as.character(trib_emisor))
df_causa <- data.frame(as.character(causa))
df_fecha <- data.frame(as.character(fecha))
df_caratula <- data.frame(as.character(caratula))
df_magistrados <- data.frame(as.character(magistrados))
df_trib_origen <- data.frame(as.character(trib_origen))
df_texto <- data.frame(as.character(texto))

# Data frame de los datos de los fallos. Se remueven las observaciones donde la SCBA no es el tribunal emisor (61 obs).
datos_fallos <- cbind(df_materia,df_tipo,df_trib_emisor,df_causa,df_fecha,df_caratula,df_magistrados,df_trib_origen)
names(datos_fallos) <- c("materia","tipo","trib.emisor","causa","fecha","caratula","magistrados","trib.origen")

# Construcción del nombre de los archivos para guardar los textos. Primero es necesario cambiar el formato de la fecha. 
datos_fallos$fecha <- gsub("\\/","-",datos_fallos$fecha)
file_names <- paste(datos_fallos$causa,"-",datos_fallos$fecha,".txt",sep="") 
file_names <- gsub("\\s","",file_names)

#### CONSTRUCCION DEL CORPUS DE LOS FALLOS JUDICIALES ####

# El primer paso es limpiar los texto de palabras y caracteres innecesarios.
df_corpus <- sapply(df_texto, function(x) gsub("Imprimir","",x)) 
df_corpus1 <- sapply(df_corpus, function(x) gsub("Descargar","",x))
df_corpus2 <- sapply(df_corpus1, function(x) gsub("TEXTO COMPLETO","",x)) 
#df_corpus3 <- sapply(df_corpus2, function(x) gsub("[\r\n\t]","",x))
df_corpus4 <- sapply(df_corpus3, function(x) gsub("\\s{2,}","",x))
#corpus <- str_wrap(df_corpus4)
names(corpus) <-datos_fallos$causa 

#### GUARDADO DE LOS DATOS EN EL DISCO LOCAL ####
# Guardado del data frame de los datos de los fallos.
write.csv(datos_fallos, file="datos_fallosV2.csv")

# Guardado de los textos de los fallos. Se guarda cada texto en archivo txt separado, indetificado por el nr de causa y la fecha. 
for (x in seq_along(corpus)){
	write.table(corpus[x], file=paste("/home/federico/Documents/Proyecto_SCBA/R/Data/Fallos/",file_names[x]))
}
# También se crea un archivo zip con todos los texto.
fallos_zip <- dir("Data/Fallos", full.names = TRUE)
zip(zipfile = "fallos-Mar2015", files = fallos_zip)

# Guardado de datos en formato RData.
save(scraped_all,file="Data/raw_html.RData")
save(urls,file="Data/urls.RData")
save(texto,file="Data/texto.RData")
save(corpus,file="Data/corpus.RData")
save(datos_fallos,file="Data/datos_fallos.RData")
