library(stringr)

### CARGAR DATOS ###
load("Data/datos_fallos.RData")
load("Data/corpus.RData")

texto_1 <- list()
texto_2 <- list()
texto_3 <- list()
texto_4 <- list()
texto_5 <- list()
texto_6 <- list()
texto_7 <- list()
texto_8 <- list()
texto_9 <- list()
texto_10 <- list()
texto_11 <- list()
texto_12 <- list()
texto_13 <- list()
texto_14 <- list()

votos_1 <- list()
votos_2 <- list()
votos_3 <- list()
votos_4 <- list()
votos_5 <- list()
votos_6 <- list()
votos_7 <- list()
votos_8 <- list()
votos_9 <- list()
votos_10 <- list()
votos_11 <- list()
votos_12 <- list()
votos_13 <- list()
votos_14 <- list()

jueces <- c("negri","genoud","de lazzari","kogan","salas","roncoroni","pettigiani","hitters","soria","laborde","san martin","pisano","vivanco","mercader","rodriguez villar","ghione","mancini","dominguez","piombo","sal llargues","natiello","borinsky","celesia","violini","de la cruz","bissio")

corpus <- tolower(corpus)
corpus <- chartr("áéíóú","aeiou",corpus)
corpus <- gsub("[\r\n\t]","",corpus)
corpus <- gsub("plateada","planteada",corpus)
corpus <- gsub("genoud, dijo","genoud dijo",corpus)
corpus <- gsub("dominguez, dijo","genoud dijo",corpus)
corpus <- gsub("mismosfundamentos","mismos fundamentos",corpus)
corpus <- gsub("dcoctor","doctor",corpus)
corpus <- gsub("cuestiontambien","cuestion tambien",corpus)
corpus <- gsub("hi-zo","hizo",corpus)
corpus <- gsub("-parcialmente-","parcialmente",corpus)

### PRIMERA CUESTION ###

for (i in 1:length(jueces)){
	texto_1[[i]] <- 	str_extract(corpus,paste("a la( misma cuestion| primera cuestion| cuestion)( planteada)?(,)? (el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)?",jueces[[i]],"(dijo)?(.*?)por la (afirmativa|negativa)"))
	votos_1[[i]] <- str_extract(texto_1[[i]],"\\w+$")
}

votos_1 <- as.data.frame(votos_1)
colnames(votos_1) <- c("negri_1","genoud_1","de lazzari_1","kogan_1","salas_1","roncoroni_1","pettigiani_1","hitters_1","soria_1","laborde_1","martin_1","pisano_1","vivanco_1","mercader_1","rodriguez_1","ghione_1","mancini_1","dominguez_1","piombo_1","llargues_1","natiello_1","borinsky_1","celesia_1","violini_1","cruz_1","bissio_1")

### SEGUNDA CUESTION ###

for (i in 1:length(jueces)){
	texto_2[[i]] <-	str_extract(corpus,paste("a la segunda cuestion( planteada)?(,)? (el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)?",jueces[[i]],"(dijo)?(.*?)por la (afirmativa|negativa)"))
	votos_2[[i]] <- str_extract(texto_2[[i]],"\\w+$")
}

votos_2 <- as.data.frame(votos_2)
colnames(votos_2) <- c("negri_2","genoud_2","de lazzari_2","kogan_2","salas_2","roncoroni_2","pettigiani_2","hitters_2","soria_2","laborde_2","martin_2","pisano_2","vivanco_2","mercader_2","rodriguez_2","ghione_2","mancini_2","dominguez_2","piombo_2","llargues_2","natiello_2","borinsky_2","celesia_2","violini_2","cruz_2","bissio_2")

### TERCERA CUESTION ###

for (i in 1:length(jueces)){
	texto_3[[i]] <-	str_extract(corpus,paste("a la tercera cuestion( planteada)?(,)? (el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)?",jueces[[i]],"(dijo)?(.*?)por la (afirmativa|negativa)"))
	votos_3[[i]] <- str_extract(texto_3[[i]],"\\w+$")
}

votos_3 <- as.data.frame(votos_3)
colnames(votos_3) <- c("negri_3","genoud_3","de lazzari_3","kogan_3","salas_3","roncoroni_3","pettigiani_3","hitters_3","soria_3","laborde_3","martin_3","pisano_3","vivanco_3","mercader_3","rodriguez_3","ghione_3","mancini_3","dominguez_3","piombo_3","llargues_3","natiello_3","borinsky_3","celesia_3","violini_3","cruz_3","bissio_3")

### CUARTA CUESTION ###

for (i in 1:length(jueces)){
	texto_4[[i]] <-	str_extract(corpus,paste("a la cuarta cuestion( planteada)?(,)? (el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)?",jueces[[i]],"(dijo)?(.*?)por la (afirmativa|negativa)"))
	votos_4[[i]] <- str_extract(texto_4[[i]],"\\w+$")
}

votos_4 <- as.data.frame(votos_4)
colnames(votos_4) <- c("negri_4","genoud_4","de lazzari_4","kogan_4","salas_4","roncoroni_4","pettigiani_4","hitters_4","soria_4","laborde_4","martin_4","pisano_4","vivanco_4","mercader_4","rodriguez_4","ghione_4","mancini_4","dominguez_4","piombo_4","llargues_4","natiello_4","borinsky_4","celesia_4","violini_4","cruz_4","bissio_4")

### QUINTA CUESTION ###

for (i in 1:length(jueces)){
	texto_5[[i]] <-	str_extract(corpus,paste("a la quinta cuestion( planteada)?(,)? (el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)?",jueces[[i]],"(dijo)?(.*?)por la (afirmativa|negativa)"))
	votos_5[[i]] <- str_extract(texto_5[[i]],"\\w+$")
}

votos_5 <- as.data.frame(votos_5)
colnames(votos_5) <- c("negri_5","genoud_5","de lazzari_5","kogan_5","salas_5","roncoroni_5","pettigiani_5","hitters_5","soria_5","laborde_5","martin_5","pisano_5","vivanco_5","mercader_5","rodriguez_5","ghione_5","mancini_5","dominguez_5","piombo_5","llargues_5","natiello_5","borinsky_5","celesia_5","violini_5","cruz_5","bissio_5")

### SEXTA CUESTION ###

for (i in 1:length(jueces)){
	texto_6[[i]] <-	str_extract(corpus,paste("a la sexta cuestion( planteada)?(,)? (el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)?",jueces[[i]],"(dijo)?(.*?)por la (afirmativa|negativa)"))
	votos_6[[i]] <- str_extract(texto_6[[i]],"\\w+$")
}

votos_6 <- as.data.frame(votos_6)
colnames(votos_6) <- c("negri_6","genoud_6","de lazzari_6","kogan_6","salas_6","roncoroni_6","pettigiani_6","hitters_6","soria_6","laborde_6","martin_6","pisano_6","vivanco_6","mercader_6","rodriguez_6","ghione_6","mancini_6","dominguez_6","piombo_6","llargues_6","natiello_6","borinsky_6","celesia_6","violini_6","cruz_6","bissio_6")

### SEPTIMA CUESTION ###

for (i in 1:length(jueces)){
	texto_7[[i]] <-	str_extract(corpus,paste("a la septima cuestion( planteada)?(,)? (el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)?",jueces[[i]],"(dijo)?(.*?)por la (afirmativa|negativa)"))
	votos_7[[i]] <- str_extract(texto_7[[i]],"\\w+$")
}

votos_7 <- as.data.frame(votos_7)
colnames(votos_7) <- c("negri_7","genoud_7","de lazzari_7","kogan_7","salas_7","roncoroni_7","pettigiani_7","hitters_7","soria_7","laborde_7","martin_7","pisano_7","vivanco_7","mercader_7","rodriguez_7","ghione_7","mancini_7","dominguez_7","piombo_7","llargues_7","natiello_7","borinsky_7","celesia_7","violini_7","cruz_7","bissio_7")

### OCTAVA CUESTION ###

for (i in 1:length(jueces)){
	texto_8[[i]] <-	str_extract(corpus,paste("a la octava cuestion( planteada)?(,)? (el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)?",jueces[[i]],"(dijo)?(.*?)por la (afirmativa|negativa)"))
	votos_8[[i]] <- str_extract(texto_8[[i]],"\\w+$")
}

votos_8 <- as.data.frame(votos_8)
colnames(votos_8) <- c("negri_8","genoud_8","de lazzari_8","kogan_8","salas_8","roncoroni_8","pettigiani_8","hitters_8","soria_8","laborde_8","martin_8","pisano_8","vivanco_8","mercader_8","rodriguez_8","ghione_8","mancini_8","dominguez_8","piombo_8","llargues_8","natiello_8","borinsky_8","celesia_8","violini_8","cruz_8","bissio_8")

### TODOS LOS VOTOS ###


### POR LOS MISMOS FUNDAMENTOS 1 ###

for (i in 1:length(jueces)){
	texto_9[[i]] <-	str_extract(corpus,paste("(el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)? ",jueces[[i]],"(, )?(\\s)?por (las|los)( mismos)? (fundamentos|razones|motivos)?( expuestos por| expuestas por| dados por)?( que)? (el|la|del|de la)( señor| señora)?( juez| jueza)?( doctor| doctora) (negri|genoud|de lazzari|kogan|salas|roncoroni|pettigiani|hitters|soria|laborde|san martin|pisano|vivanco|mercader|rodriguez villar|ghione|mancini|dominguez|piombo|sal llargues|natiello|borinsky|celesia|violini|de la cruz|bissio)(,)? voto (tambien|la cuestion( tambien| planteada( tambien)?)?|la primera cuestion( planteada)?( tambien)?|en el mismo sentido)?(\\s)?por la (afirmativa|negativa)",sep=""))
	votos_9[[i]] <- str_extract(texto_9[[i]],"\\w+$")
}

votos_9 <- as.data.frame(votos_9)
colnames(votos_9) <- c("negri_9","genoud_9","de lazzari_9","kogan_9","salas_9","roncoroni_9","pettigiani_9","hitters_9","soria_9","laborde_9","martin_9","pisano_9","vivanco_9","mercader_9","rodriguez_9","ghione_9","mancini_9","dominguez_9","piombo_9","llargues_9","natiello_9","borinsky_9","celesia_9","violini_9","cruz_9","bissio_9")

### POR LOS MISMOS FUNDAMENTOS 2 ###

for (i in 1:length(jueces)){
	texto_10[[i]] <- str_extract(corpus,paste("(el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)? ",jueces[[i]],"(, )?(\\s)?por (las|los)( mismos)? (fundamentos|razones|motivos)?( expuestos por| expuestas por| dados por)?( que)? (el|la|del|de la)( señor| señora)?( juez| jueza)?( doctor| doctora) (negri|genoud|de lazzari|kogan|salas|roncoroni|pettigiani|hitters|soria|laborde|san martin|pisano|vivanco|mercader|rodriguez villar|ghione|mancini|dominguez|piombo|sal llargues|natiello|borinsky|celesia|violini|de la cruz|bissio)(,)? voto la segunda cuestion( planteada)?( tambien)? por la (afirmativa|negativa)",sep=""))
	votos_10[[i]] <- str_extract(texto_10[[i]],"\\w+$")
}

votos_10 <- as.data.frame(votos_10)
colnames(votos_10) <- c("negri_10","genoud_10","de lazzari_10","kogan_10","salas_10","roncoroni_10","pettigiani_10","hitters_10","soria_10","laborde_10","martin_10","pisano_10","vivanco_10","mercader_10","rodriguez_10","ghione_10","mancini_10","dominguez_10","piombo_10","llargues_10","natiello_10","borinsky_10","celesia_10","violini_10","cruz_10","bissio_10")

### POR LOS MISMOS FUNDAMENTOS 3 ###

for (i in 1:length(jueces)){
	texto_11[[i]] <- str_extract(corpus,paste("(el|la)( señor| señora)?( juez| jueza)?( doctor| doctora)? ",jueces[[i]],"(, )?(\\s)?por (las|los)( mismos)? (fundamentos|razones|motivos)?( expuestos por| expuestas por| dados por)?( que)? (el|la|del|de la)( señor| señora)?( juez| jueza)?( doctor| doctora) (negri|genoud|de lazzari|kogan|salas|roncoroni|pettigiani|hitters|soria|laborde|san martin|pisano|vivanco|mercader|rodriguez villar|ghione|mancini|dominguez|piombo|sal llargues|natiello|borinsky|celesia|violini|de la cruz|bissio)(,)? voto la tercera cuestion( planteada)?( tambien)? por la (afirmativa|negativa)",sep=""))
	votos_11[[i]] <- str_extract(texto_11[[i]],"\\w+$")
}

votos_11 <- as.data.frame(votos_11)
colnames(votos_11) <- c("negri_11","genoud_11","de lazzari_11","kogan_11","salas_11","roncoroni_11","pettigiani_11","hitters_11","soria_11","laborde_11","martin_11","pisano_11","vivanco_11","mercader_11","rodriguez_11","ghione_11","mancini_11","dominguez_11","piombo_11","llargues_11","natiello_11","borinsky_11","celesia_11","violini_11","cruz_11","bissio_11")

### PLURAL 1 ###
plural_1_grep <- perl("los señores jueces((?:(?!los señores jueces).)*?)(votaron|votan)( la primera cuestion| la cuestion)?( planteada)?( tambien| parcialmente)? por la (afirmativa|negativa)") 

match_plural <- sapply(corpus,function(x) str_extract_all(x,plural_1_grep))
match_plural <- gsub("por (las|los)( mismos)? (fundamentos|razones|motivos)?( expuestos por| expuestas por| dados por)?( que)? (el|la|del|de la)( señor| señora)?( juez| jueza)? (doctor|doctora) (negri|genoud|de lazzari|kogan|salas|roncoroni|pettigiani|hitters|soria|laborde|san martin|pisano|vivanco|mercader|rodriguez villar|ghione|mancini|dominguez|piombo|sal llargues|natiello|borinsky|celesia|violini|de la cruz|bissio)","",match_plural)
match_plural <- gsub("\"|\\)","",match_plural)

plural_1_negri <- ifelse(str_detect(match_plural,"negri"),str_extract(match_plural,"\\w+$"),NA)
plural_1_genoud <- ifelse(str_detect(match_plural,"genoud"),str_extract(match_plural,"\\w+$"),NA)
plural_1_lazzari <- ifelse(str_detect(match_plural,"lazzari"),str_extract(match_plural,"\\w+$"),NA)
plural_1_kogan <- ifelse(str_detect(match_plural,"kogan"),str_extract(match_plural,"\\w+$"),NA)
plural_1_salas <- ifelse(str_detect(match_plural,"salas"),str_extract(match_plural,"\\w+$"),NA)
plural_1_roncoroni <- ifelse(str_detect(match_plural,"roncoroni"),str_extract(match_plural,"\\w+$"),NA)
plural_1_pettigiani <- ifelse(str_detect(match_plural,"pettigiani"),str_extract(match_plural,"\\w+$"),NA)
plural_1_hitters <- ifelse(str_detect(match_plural,"hitters"),str_extract(match_plural,"\\w+$"),NA)
plural_1_soria <- ifelse(str_detect(match_plural,"soria"),str_extract(match_plural,"\\w+$"),NA)
plural_1_laborde <- ifelse(str_detect(match_plural,"laborde"),str_extract(match_plural,"\\w+$"),NA)
plural_1_martin <- ifelse(str_detect(match_plural,"martin"),str_extract(match_plural,"\\w+$"),NA)
plural_1_pisano <- ifelse(str_detect(match_plural,"pisano"),str_extract(match_plural,"\\w+$"),NA)
plural_1_vivanco <- ifelse(str_detect(match_plural,"vivanco"),str_extract(match_plural,"\\w+$"),NA)
plural_1_mercader <- ifelse(str_detect(match_plural,"mercader"),str_extract(match_plural,"\\w+$"),NA)
plural_1_rodriguez <- ifelse(str_detect(match_plural,"rodriguez"),str_extract(match_plural,"\\w+$"),NA)
plural_1_ghione <- ifelse(str_detect(match_plural,"ghione"),str_extract(match_plural,"\\w+$"),NA)
plural_1_mancini <- ifelse(str_detect(match_plural,"mancini"),str_extract(match_plural,"\\w+$"),NA)
plural_1_dominguez <- ifelse(str_detect(match_plural,"dominguez"),str_extract(match_plural,"\\w+$"),NA)
plural_1_piombo <- ifelse(str_detect(match_plural,"piombo"),str_extract(match_plural,"\\w+$"),NA)
plural_1_llargues <- ifelse(str_detect(match_plural,"llargues"),str_extract(match_plural,"\\w+$"),NA)
plural_1_natiello <- ifelse(str_detect(match_plural,"natiello"),str_extract(match_plural,"\\w+$"),NA)
plural_1_borinsky <- ifelse(str_detect(match_plural,"borinsky"),str_extract(match_plural,"\\w+$"),NA)
plural_1_celesia <- ifelse(str_detect(match_plural,"celesia"),str_extract(match_plural,"\\w+$"),NA)
plural_1_violini <- ifelse(str_detect(match_plural,"violini"),str_extract(match_plural,"\\w+$"),NA)
plural_1_cruz <- ifelse(str_detect(match_plural,"cruz"),str_extract(match_plural,"\\w+$"),NA)
plural_1_bissio <- ifelse(str_detect(match_plural,"bissio"),str_extract(match_plural,"\\w+$"),NA)


votos_12 <- cbind(plural_1_negri,plural_1_genoud,plural_1_lazzari,plural_1_kogan,plural_1_salas,plural_1_roncoroni,plural_1_pettigiani,plural_1_hitters,plural_1_soria,plural_1_laborde,plural_1_martin,plural_1_pisano,plural_1_vivanco,plural_1_mercader,plural_1_rodriguez,plural_1_ghione,plural_1_mancini,plural_1_dominguez,plural_1_piombo,plural_1_llargues,plural_1_natiello,plural_1_borinsky,plural_1_celesia,plural_1_violini,plural_1_cruz,plural_1_bissio)

colnames(votos_12) <- c("negri_12","genoud_12","de lazzari_12","kogan_12","salas_12","roncoroni_12","pettigiani_12","hitters_12","soria_12","laborde_12","martin_12","pisano_12","vivanco_12","mercader_12","rodriguez_12","ghione_12","mancini_12","dominguez_12","piombo_12","llargues_12","natiello_12","borinsky_12","celesia_12","violini_12","cruz_12","bissio_12")

### PLURAL 2 ###

plural_2_grep <- perl("\\.(\\s)?los señores jueces((?:(?!\\.(\\s)?los señores jueces).)*?)(votaron|votan) la segunda cuestion( planteada)?( tambien| parcialmente)? por la (afirmativa|negativa)") 

match_plural <- sapply(corpus,function(x) str_extract_all(x,plural_2_grep))
match_plural <- gsub("por (las|los)( mismos)? (fundamentos|razones|motivos)?( expuestos por| expuestas por| dados por)?( que)? (el|la|del|de la)( señor| señora)?( juez| jueza)? (doctor|doctora) (negri|genoud|de lazzari|kogan|salas|roncoroni|pettigiani|hitters|soria|laborde|san martin|pisano|vivanco|mercader|rodriguez villar|ghione|mancini|dominguez|piombo|sal llargues|natiello|borinsky|celesia|violini|de la cruz|bissio)","",match_plural)
match_plural <- gsub("\"|\\)","",match_plural)

plural_2_negri <- ifelse(str_detect(match_plural,"negri"),str_extract(match_plural,"\\w+$"),NA)
plural_2_genoud <- ifelse(str_detect(match_plural,"genoud"),str_extract(match_plural,"\\w+$"),NA)
plural_2_lazzari <- ifelse(str_detect(match_plural,"lazzari"),str_extract(match_plural,"\\w+$"),NA)
plural_2_kogan <- ifelse(str_detect(match_plural,"kogan"),str_extract(match_plural,"\\w+$"),NA)
plural_2_salas <- ifelse(str_detect(match_plural,"salas"),str_extract(match_plural,"\\w+$"),NA)
plural_2_roncoroni <- ifelse(str_detect(match_plural,"roncoroni"),str_extract(match_plural,"\\w+$"),NA)
plural_2_pettigiani <- ifelse(str_detect(match_plural,"pettigiani"),str_extract(match_plural,"\\w+$"),NA)
plural_2_hitters <- ifelse(str_detect(match_plural,"hitters"),str_extract(match_plural,"\\w+$"),NA)
plural_2_soria <- ifelse(str_detect(match_plural,"soria"),str_extract(match_plural,"\\w+$"),NA)
plural_2_laborde <- ifelse(str_detect(match_plural,"laborde"),str_extract(match_plural,"\\w+$"),NA)
plural_2_martin <- ifelse(str_detect(match_plural,"martin"),str_extract(match_plural,"\\w+$"),NA)
plural_2_pisano <- ifelse(str_detect(match_plural,"pisano"),str_extract(match_plural,"\\w+$"),NA)
plural_2_vivanco <- ifelse(str_detect(match_plural,"vivanco"),str_extract(match_plural,"\\w+$"),NA)
plural_2_mercader <- ifelse(str_detect(match_plural,"mercader"),str_extract(match_plural,"\\w+$"),NA)
plural_2_rodriguez <- ifelse(str_detect(match_plural,"rodriguez"),str_extract(match_plural,"\\w+$"),NA)
plural_2_ghione <- ifelse(str_detect(match_plural,"ghione"),str_extract(match_plural,"\\w+$"),NA)
plural_2_mancini <- ifelse(str_detect(match_plural,"mancini"),str_extract(match_plural,"\\w+$"),NA)
plural_2_dominguez <- ifelse(str_detect(match_plural,"dominguez"),str_extract(match_plural,"\\w+$"),NA)
plural_2_piombo <- ifelse(str_detect(match_plural,"piombo"),str_extract(match_plural,"\\w+$"),NA)
plural_2_llargues <- ifelse(str_detect(match_plural,"llargues"),str_extract(match_plural,"\\w+$"),NA)
plural_2_natiello <- ifelse(str_detect(match_plural,"natiello"),str_extract(match_plural,"\\w+$"),NA)
plural_2_borinsky <- ifelse(str_detect(match_plural,"borinsky"),str_extract(match_plural,"\\w+$"),NA)
plural_2_celesia <- ifelse(str_detect(match_plural,"celesia"),str_extract(match_plural,"\\w+$"),NA)
plural_2_violini <- ifelse(str_detect(match_plural,"violini"),str_extract(match_plural,"\\w+$"),NA)
plural_2_cruz <- ifelse(str_detect(match_plural,"cruz"),str_extract(match_plural,"\\w+$"),NA)
plural_2_bissio <- ifelse(str_detect(match_plural,"bissio"),str_extract(match_plural,"\\w+$"),NA)


votos_13 <- cbind(plural_2_negri,plural_2_genoud,plural_2_lazzari,plural_2_kogan,plural_2_salas,plural_2_roncoroni,plural_2_pettigiani,plural_2_hitters,plural_2_soria,plural_2_laborde,plural_2_martin,plural_2_pisano,plural_2_vivanco,plural_2_mercader,plural_2_rodriguez,plural_2_ghione,plural_2_mancini,plural_2_dominguez,plural_2_piombo,plural_2_llargues,plural_2_natiello,plural_2_borinsky,plural_2_celesia,plural_2_violini,plural_2_cruz,plural_2_bissio)

colnames(votos_13) <- c("negri_13","genoud_13","de lazzari_13","kogan_13","salas_13","roncoroni_13","pettigiani_13","hitters_13","soria_13","laborde_13","martin_13","pisano_13","vivanco_13","mercader_13","rodriguez_13","ghione_13","mancini_13","dominguez_13","piombo_13","llargues_13","natiello_13","borinsky_13","celesia_13","violini_13","cruz_13","bissio_13")

### PLURAL 3 ###

plural_3_grep <- perl("los señores jueces((?:(?!los señores jueces).)*?)(votaron|votan) la tercera cuestion( planteada)?( tambien| parcialmente)? por la (afirmativa|negativa)") 

match_plural <- sapply(corpus,function(x) str_extract_all(x,plural_3_grep))
match_plural <- gsub("por (las|los)( mismos)? (fundamentos|razones|motivos)?( expuestos por| expuestas por| dados por)?( que)? (el|la|del|de la)( señor| señora)?( juez| jueza)? (doctor|doctora) (negri|genoud|de lazzari|kogan|salas|roncoroni|pettigiani|hitters|soria|laborde|san martin|pisano|vivanco|mercader|rodriguez villar|ghione|mancini|dominguez|piombo|sal llargues|natiello|borinsky|celesia|violini|de la cruz|bissio)","",match_plural)
match_plural <- gsub("\"|\\)","",match_plural)

plural_3_negri <- ifelse(str_detect(match_plural,"negri"),str_extract(match_plural,"\\w+$"),NA)
plural_3_genoud <- ifelse(str_detect(match_plural,"genoud"),str_extract(match_plural,"\\w+$"),NA)
plural_3_lazzari <- ifelse(str_detect(match_plural,"lazzari"),str_extract(match_plural,"\\w+$"),NA)
plural_3_kogan <- ifelse(str_detect(match_plural,"kogan"),str_extract(match_plural,"\\w+$"),NA)
plural_3_salas <- ifelse(str_detect(match_plural,"salas"),str_extract(match_plural,"\\w+$"),NA)
plural_3_roncoroni <- ifelse(str_detect(match_plural,"roncoroni"),str_extract(match_plural,"\\w+$"),NA)
plural_3_pettigiani <- ifelse(str_detect(match_plural,"pettigiani"),str_extract(match_plural,"\\w+$"),NA)
plural_3_hitters <- ifelse(str_detect(match_plural,"hitters"),str_extract(match_plural,"\\w+$"),NA)
plural_3_soria <- ifelse(str_detect(match_plural,"soria"),str_extract(match_plural,"\\w+$"),NA)
plural_3_laborde <- ifelse(str_detect(match_plural,"laborde"),str_extract(match_plural,"\\w+$"),NA)
plural_3_martin <- ifelse(str_detect(match_plural,"martin"),str_extract(match_plural,"\\w+$"),NA)
plural_3_pisano <- ifelse(str_detect(match_plural,"pisano"),str_extract(match_plural,"\\w+$"),NA)
plural_3_vivanco <- ifelse(str_detect(match_plural,"vivanco"),str_extract(match_plural,"\\w+$"),NA)
plural_3_mercader <- ifelse(str_detect(match_plural,"mercader"),str_extract(match_plural,"\\w+$"),NA)
plural_3_rodriguez <- ifelse(str_detect(match_plural,"rodriguez"),str_extract(match_plural,"\\w+$"),NA)
plural_3_ghione <- ifelse(str_detect(match_plural,"ghione"),str_extract(match_plural,"\\w+$"),NA)
plural_3_mancini <- ifelse(str_detect(match_plural,"mancini"),str_extract(match_plural,"\\w+$"),NA)
plural_3_dominguez <- ifelse(str_detect(match_plural,"dominguez"),str_extract(match_plural,"\\w+$"),NA)
plural_3_piombo <- ifelse(str_detect(match_plural,"piombo"),str_extract(match_plural,"\\w+$"),NA)
plural_3_llargues <- ifelse(str_detect(match_plural,"llargues"),str_extract(match_plural,"\\w+$"),NA)
plural_3_natiello <- ifelse(str_detect(match_plural,"natiello"),str_extract(match_plural,"\\w+$"),NA)
plural_3_borinsky <- ifelse(str_detect(match_plural,"borinsky"),str_extract(match_plural,"\\w+$"),NA)
plural_3_celesia <- ifelse(str_detect(match_plural,"celesia"),str_extract(match_plural,"\\w+$"),NA)
plural_3_violini <- ifelse(str_detect(match_plural,"violini"),str_extract(match_plural,"\\w+$"),NA)
plural_3_cruz <- ifelse(str_detect(match_plural,"cruz"),str_extract(match_plural,"\\w+$"),NA)
plural_3_bissio <- ifelse(str_detect(match_plural,"bissio"),str_extract(match_plural,"\\w+$"),NA)


votos_14 <- cbind(plural_3_negri,plural_3_genoud,plural_3_lazzari,plural_3_kogan,plural_3_salas,plural_3_roncoroni,plural_3_pettigiani,plural_3_hitters,plural_3_soria,plural_3_laborde,plural_3_martin,plural_3_pisano,plural_3_vivanco,plural_3_mercader,plural_3_rodriguez,plural_3_ghione,plural_3_mancini,plural_3_dominguez,plural_3_piombo,plural_3_llargues,plural_3_natiello,plural_3_borinsky,plural_3_celesia,plural_3_violini,plural_3_cruz,plural_3_bissio)

colnames(votos_14) <- c("negri_14","genoud_14","de lazzari_14","kogan_14","salas_14","roncoroni_14","pettigiani_14","hitters_14","soria_14","laborde_14","martin_14","pisano_14","vivanco_14","mercader_14","rodriguez_14","ghione_14","mancini_14","dominguez_14","piombo_14","llargues_14","natiello_14","borinsky_14","celesia_14","violini_14","cruz_14","bissio_14")



### TODOS LOS VOTOS ###
votos <- cbind(votos_1,votos_2,votos_3,votos_4,votos_5,votos_6,votos_7,votos_8,votos_9,votos_10,votos_11,votos_12,votos_13,votos_14)

### ORDEN VOTACION ###
mag <- strsplit(as.character(datos_fallos$magistrados),"-")
mag_length <- max(sapply(mag, length))
mag_cols <- lapply(mag, function(x) c(x, rep(NA, mag_length - length(x))))
orden_vot <- data.frame(t(do.call(cbind,mag_cols)))
orden_vot <- as.data.frame(sapply(orden_vot, tolower))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("^\\s+|\\s+$","", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("de lazzari","de l�zzari", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("de l�zari","de l�zzari", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("petttigiani","pettigiani", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("petttiginai","pettigiani", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("pettiginai","pettigiani", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("hittes","hitters", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("dominguez","dom�nguez", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("rodriguez villar","rodr�guez villar", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("san martin","san mart�n", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("sal llargues","sal llargu�s", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("rocoroni","roncoroni", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("macini","mancini", x, perl=TRUE)))
names(orden_vot) <- c("primero","segundo","tercero","cuarto","quinto","sexto","septimo","octavo","noveno")

### MAX DESICIONES ###

cuestiones <- str_extract(corpus,"(c u e s t i o n|c u e s t i o n e s)(.*?)v o t a c i o n")
cuestiones_grep <-perl("(\\d(ª|º|°|a|ra|da|\\))(?!(.*)\\d(ª|º|°|a|ra|da|\\))))")
max_cuestiones <- ifelse(str_detect(cuestiones,cuestiones_grep),str_extract(cuestiones,cuestiones_grep),"1")
max_cuestiones <- gsub("ª|º|°|a|ra|da|\\)","",max_cuestiones)
max_cuestiones <- as.numeric(max_cuestiones)

nr_jueces <- apply(orden_vot,1,function(x) sum(!is.na(x))) 
nr_votos <- nr_jueces * max_cuestiones
tot_votos <- apply(votos,1,function(x) sum(!is.na(x))) 
dif <- nr_votos - tot_votos

### ANTECEDENTES ###

antecedentes <- str_extract(corpus,"a n t e c e d e n t e s(.*?)c u e s t i o n")
x = str_extract(antecedentes,"(la sala|el tribunal|la camara)(.*?)(modifico( parcialmente)? (el fallo|la sentencia|el pronunciamiento)|hizo lugar( parcialmente| en forma parcial)? a la (demanda|pretension|accion|defensa)|rechazo( integramente| parcialmente)?.*?la (demanda|pretension|accion|el recurso de apelacion)|revoco( parcialmente)? (el fallo|la sentencia|el pronunciamiento)|desestimo (la demanda|el recurso)|confirmo( parcialmente)?|acogio( parcialmente)?|se declaro incompetente|declaro( abstracto)? (el planteo de|la) inconstitucionalidad|admitio( parcialmente)? el reclamo)|((promueve(n)?|promovio) demanda( contencioso administrativa)? contra (la provincia|el municipio|la municipalidad))")

## se remueve las columnas que tienen solo NAs ##

votos <- votos[,colSums(is.na(votos)) != nrow(votos)]
votos <- sapply(votos, as.numeric)
votos[votos == 2] <- 0
votos <- as.data.frame(votos)

sum_votos <- rowSums(votos,na.rm=TRUE)
resultado <- ifelse(sum_votos == 0 | sum_votos < tot_votos/2,"negativo","afirmativo")
unanime <- ifelse(sum_votos == 0 | sum_votos == tot_votos,1,0)

votos_final <- cbind(datos_fallos,orden_vot,votos,max_cuestiones,nr_jueces,nr_votos,tot_votos,dif,sum_votos,resultado,unanime)

votos_final <- votos_final[votos_final$dif == 0,]
votos_final <- votos_final[complete.cases(votos_final$dif),]
votos_unanimes <- votos_final[votos_final$unanime == 1,]
votos_disidencia <- votos_final[votos_final$unanime == 0,]

write.csv(votos_final,file="votos_final.csv")
write.csv(votos_unanimes,file="votos_unanimes.csv")
write.csv(votos_disidencia,file="votos_disidencia.csv")

save(votos_final,file="Data/votos_final.RData")
save(votos_unanimes,file="Data/votos_unanimes.RData")
save(votos_disidencia,file="Data/votos_disidencia.RData")
