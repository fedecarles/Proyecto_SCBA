# File-Name:       Corpus_Fallos.R
# Date:            12.01.2015
# Author:          Federico Carlés
# Email:           fedecarles@gmail.com                                      
# Data:            www.scba.gov.ar
# Packages Used:   XML, stringr
# R version        3.1.2 (2014-10-31)
# System           Linux Mint 17 (Qiana)
# Encoding         UTF-8


library(XML)
require(stringr)

url_file <- read.csv("urls_fallos_list.csv")
urls <- as.character(url_file[1:19085,])

file_name <- str_extract_all(urls, pattern = "(([0-9]{4}(.*))\\.doc)" )
file_name <- gsub(pattern="\\/", replace = "-", x = file_name)
file_name <- gsub(pattern="\\.doc", replace = "", x = file_name)

text <- list()

for (i in urls[1:19085]){
        text13[i] <- xpathSApply(htmlParse(i), "//*[contains(@class, 'mini')]", xmlValue)
}

for (x in 1:2000)
        write.table(text[[x]], file= paste(file_name[x],"-",x, "txt", sep="."))


eliminr url[9462] [11452] [13361]


