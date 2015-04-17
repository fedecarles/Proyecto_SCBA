library(stringr)

### CARGAR DATOS ###
load("Data/datos_fallos.RData")
load("Data/corpus.RData")
load("Data/votos.RData")

## CORRECIONES EN EL CORPUS ###
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


### CORRECIONES EN DATOS FALLOS ###
mag <- strsplit(as.character(datos_fallos$magistrados),"-")
mag_length <- max(sapply(mag, length))
mag_cols <- lapply(mag, function(x) c(x, rep(NA, mag_length - length(x))))
orden_vot <- data.frame(t(do.call(cbind,mag_cols)))
orden_vot <- as.data.frame(sapply(orden_vot, tolower))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) chartr("áéíóú","aeiou",x)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("^\\s+|\\s+$","", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("\\.","", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("de lazari","de lazzari", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("nergri","negri", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("petttigiani|petttiginai|pettiginai|pettgiani|petigiani|petitgiani|pettigini|pettgigiani","pettigiani", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("hittes|hiters","hitters", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("ssoria","soria", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("rocoroni","roncoroni", x, perl=TRUE)))
orden_vot <- as.data.frame(sapply(orden_vot, function(x) gsub("macini","mancini", x, perl=TRUE)))
names(orden_vot) <- c("primero","segundo","tercero","cuarto","quinto","sexto","septimo","octavo","noveno")

### AÑO ###
ano <- str_extract(datos_fallos$fecha,"[0-9]{4}")

### PARTES ### 
caratula_split <- strsplit(as.character(datos_fallos$caratula),"c/|contra")
actor <- lapply(caratula_split, "[[", 1)
actor <- tolower(as.character(unlist(actor)))
actor <- chartr("áéíóú","aeiou",actor)
dem_acc <- lapply(caratula_split, "[", 2)
demandado_split <- str_split(as.character(dem_acc), "s/")
demandado <- lapply(demandado_split, "[", 1)
demandado <- tolower(as.character(unlist(demandado)))
demandado <- chartr("áéíóú","aeiou",demandado)
voz <- lapply(demandado_split, "[", 2)
voz <- tolower(as.character(unlist(voz)))
voz <- chartr("áéíóú","aeiou",voz)

### DESICIONES ###
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
antecedentes <- gsub("\\,|\\.","",antecedentes) 

### SENTENCIA ###
sentencia <- str_extract(corpus,"s e n t e n c i a(.*)")
sentencia <- gsub("\\,|\\.","",sentencia) 

### RESULTADOS ###
sum_votos <- rowSums(votos,na.rm=TRUE)
resultado <- ifelse(sum_votos == 0 | sum_votos < tot_votos/2,"negativo","afirmativo")
unanime <- ifelse(sum_votos == 0 | sum_votos == tot_votos,1,0)

votos_final <- cbind(datos_fallos,orden_vot,votos,max_cuestiones,nr_jueces,nr_votos,tot_votos,dif,sum_votos,ano,resultado,unanime,actor,demandado,voz,antecedentes)

### SUBSET VOTOS COMPLETOS ###
votos_completos <- votos_final[votos_final$dif == 0,]
votos_completos <- votos_completos[complete.cases(votos_completos$dif),]
votos_unanimes <- votos_completos[votos_completos$unanime == 1,]
votos_disidencia <- votos_completos[votos_completos$unanime == 0,]

## se excluyen los fallos con disidencia donde la provincia es una de las partes ##
votos_disidencia <- votos_disidencia[grepl("prov|pcia|municip",votos_disidencia$actor)==FALSE,]
votos_disidencia <- votos_disidencia[grepl("prov|pcia|municip",votos_disidencia$demandado)==FALSE,]

### SUBSET VOTOS PROVINCIA ###
votos_pcia <- votos_completos[grepl("prov|pcia|municip",votos_completos$actor)==TRUE|grepl("prov|pcia|municip",votos_completos$demandado)==TRUE,]
votos_pcia <- votos_pcia[,colSums(is.na(votos_pcia)) != nrow(votos_pcia)]

## 1 cuestion ##
votos_pcia_1_1 <- votos_pcia[votos_pcia$max_cuestiones == 1,]
votos_pcia_1_1$cuestion <- 1

## 2 cuestiones ##
votos_pcia_2 <- votos_pcia[votos_pcia$max_cuestiones == 2,]

# primera #
votos_pcia_2_1 <- votos_pcia_2
nombres_2_1 <- str_extract(colnames(votos_pcia_2_1),".*?_(2|10|13)")
nombres_2_1 <- nombres_2_1[!is.na(nombres_2_1)]
votos_pcia_2_1[c(nombres_2_1)] <- NA
votos_pcia_2_1$cuestion <- 1
# segunda #
votos_pcia_2_2 <- votos_pcia_2 
nombres_2_2 <- str_extract(colnames(votos_pcia_2_2),".*?_(1$|9|12)")
nombres_2_2 <- nombres_2_2[!is.na(nombres_2_2)]
votos_pcia_2_2[c(nombres_2_2)] <- NA
votos_pcia_2_2$cuestion <- 2

## 3 cuestiones ##
votos_pcia_3 <- votos_pcia[votos_pcia$max_cuestiones == 3,]

# primera #
votos_pcia_3_1 <- votos_pcia_3
nombres_3_1 <- str_extract(colnames(votos_pcia_3_1),".*?_(2|3|10|11|13|14)")
nombres_3_1 <- nombres_3_1[!is.na(nombres_3_1)]
votos_pcia_3_1[c(nombres_3_1)] <- NA
votos_pcia_3_1$cuestion <- 1
# segunda #
votos_pcia_3_2 <- votos_pcia_3 
nombres_3_2 <- str_extract(colnames(votos_pcia_3_2),".*?_(1$|3|9|11|12|14)")
nombres_3_2 <- nombres_3_2[!is.na(nombres_3_2)]
votos_pcia_3_2[c(nombres_3_2)] <- NA
votos_pcia_3_2$cuestion <- 2
# tercera #
votos_pcia_3_3 <- votos_pcia_3 
nombres_3_3 <- str_extract(colnames(votos_pcia_3_3),".*?_(1$|2|9|10|12|13)")
nombres_3_3 <- nombres_3_3[!is.na(nombres_3_3)]
votos_pcia_3_3[c(nombres_3_3)] <- NA
votos_pcia_3_3$cuestion <- 3

## consolidación ##
votos_pcia_cons <- rbind(votos_pcia_1_1,votos_pcia_2_1,votos_pcia_2_2,votos_pcia_3_1,votos_pcia_3_2,votos_pcia_3_3)

### CONSOLIDACION DE VOTOS INDIVIDUALES ###
votos_pcia_cons[votos_pcia_cons==0] <- 2
## negri ##
negri <- str_extract(colnames(votos_pcia_cons),"negri_[0-9][0-9]?")
negri <- negri[!is.na(negri)]
v_negri <- rowSums(votos_pcia_cons[c(negri)],na.rm=TRUE) 
## genoud ##
genoud <- str_extract(colnames(votos_pcia_cons),"genoud_[0-9][0-9]?")
genoud <- genoud[!is.na(genoud)]
v_genoud <- rowSums(votos_pcia_cons[c(genoud)],na.rm=TRUE) 
## de lazzari ##
lazzari <- str_extract(colnames(votos_pcia_cons),"de lazzari_[0-9][0-9]?")
lazzari <- lazzari[!is.na(lazzari)]
v_lazzari <- rowSums(votos_pcia_cons[c(lazzari)],na.rm=TRUE) 
## kogan ##
kogan <- str_extract(colnames(votos_pcia_cons),"kogan_[0-9][0-9]?")
kogan <- kogan[!is.na(kogan)]
v_kogan <- rowSums(votos_pcia_cons[c(kogan)],na.rm=TRUE) 
## salas ##
salas <- str_extract(colnames(votos_pcia_cons),"salas_[0-9][0-9]?")
salas <- salas[!is.na(salas)]
v_salas <- rowSums(votos_pcia_cons[c(salas)],na.rm=TRUE) 
## roncoroni ##
roncoroni <- str_extract(colnames(votos_pcia_cons),"roncoroni_[0-9][0-9]?")
roncoroni <- roncoroni[!is.na(roncoroni)]
v_roncoroni <- rowSums(votos_pcia_cons[c(roncoroni)],na.rm=TRUE) 
## pettigiani ##
pettigiani <- str_extract(colnames(votos_pcia_cons),"pettigiani_[0-9][0-9]?")
pettigiani <- pettigiani[!is.na(pettigiani)]
v_pettigiani <- rowSums(votos_pcia_cons[c(pettigiani)],na.rm=TRUE) 
## hitters ##
hitters <- str_extract(colnames(votos_pcia_cons),"hitters_[0-9][0-9]?")
hitters <- hitters[!is.na(hitters)]
v_hitters <- rowSums(votos_pcia_cons[c(hitters)],na.rm=TRUE) 
## soria ##
soria <- str_extract(colnames(votos_pcia_cons),"soria_[0-9][0-9]?")
soria <- soria[!is.na(soria)]
v_soria <- rowSums(votos_pcia_cons[c(soria)],na.rm=TRUE) 
## laborde ##
laborde <- str_extract(colnames(votos_pcia_cons),"laborde_[0-9][0-9]?")
laborde <- laborde[!is.na(laborde)]
v_laborde <- rowSums(votos_pcia_cons[c(laborde)],na.rm=TRUE) 
## martin ##
martin <- str_extract(colnames(votos_pcia_cons),"martin_[0-9][0-9]?")
martin <- martin[!is.na(martin)]
v_martin <- rowSums(votos_pcia_cons[c(martin)],na.rm=TRUE) 
## pisano ##
pisano <- str_extract(colnames(votos_pcia_cons),"pisano_[0-9][0-9]?")
pisano <- pisano[!is.na(pisano)]
v_pisano <- rowSums(votos_pcia_cons[c(pisano)],na.rm=TRUE) 
## vivanco ##
vivanco <- str_extract(colnames(votos_pcia_cons),"vivanco_[0-9][0-9]?")
vivanco <- vivanco[!is.na(vivanco)]
v_vivanco <- rowSums(votos_pcia_cons[c(vivanco)],na.rm=TRUE) 
## mercader ##
mercader <- str_extract(colnames(votos_pcia_cons),"mercader_[0-9][0-9]?")
mercader <- mercader[!is.na(mercader)]
v_mercader <- rowSums(votos_pcia_cons[c(mercader)],na.rm=TRUE) 
## rodriguez ##
rodriguez <- str_extract(colnames(votos_pcia_cons),"rodriguez_[0-9][0-9]?")
rodriguez <- rodriguez[!is.na(rodriguez)]
v_rodriguez <- rowSums(votos_pcia_cons[c(rodriguez)],na.rm=TRUE) 
## ghione ##
ghione <- str_extract(colnames(votos_pcia_cons),"ghione_[0-9][0-9]?")
ghione <- ghione[!is.na(ghione)]
v_ghione <- rowSums(votos_pcia_cons[c(ghione)],na.rm=TRUE) 
## mancini ##
mancini <- str_extract(colnames(votos_pcia_cons),"mancini_[0-9][0-9]?")
mancini <- mancini[!is.na(mancini)]
v_mancini <- rowSums(votos_pcia_cons[c(mancini)],na.rm=TRUE) 
## dominguez ##
dominguez <- str_extract(colnames(votos_pcia_cons),"dominguez_[0-9][0-9]?")
dominguez <- dominguez[!is.na(dominguez)]
v_dominguez <- rowSums(votos_pcia_cons[c(dominguez)],na.rm=TRUE) 
## llargues ##
llargues <- str_extract(colnames(votos_pcia_cons),"llargues_[0-9][0-9]?")
llargues <- llargues[!is.na(llargues)]
v_llargues <- rowSums(votos_pcia_cons[c(llargues)],na.rm=TRUE) 
## natiello ##
natiello <- str_extract(colnames(votos_pcia_cons),"natiello_[0-9][0-9]?")
natiello <- natiello[!is.na(natiello)]
v_natiello <- rowSums(votos_pcia_cons[c(natiello)],na.rm=TRUE) 
## celesia ##
celesia <- str_extract(colnames(votos_pcia_cons),"celesia_[0-9][0-9]?")
celesia <- celesia[!is.na(celesia)]
v_celesia <- rowSums(votos_pcia_cons[c(celesia)],na.rm=TRUE) 
## violini ##
violini <- str_extract(colnames(votos_pcia_cons),"violini_[0-9][0-9]?")
violini <- violini[!is.na(violini)]
v_violini <- rowSums(votos_pcia_cons[c(violini)],na.rm=TRUE) 

### DATASET FINAL ###
dataset_final <- data.frame(votos_pcia_cons$materia,votos_pcia_cons$causa,votos_pcia_cons$caratula,votos_pcia_cons$fecha,votos_pcia_cons$ano,votos_pcia_cons$trib.origen,votos_pcia_cons$nr_jueces,votos_pcia_cons$max_cuestiones,votos_pcia_cons$cuestion,v_negri,v_genoud,v_lazzari,v_kogan,v_salas,v_roncoroni,v_pettigiani,v_hitters,v_soria,v_laborde,v_martin,v_pisano,v_vivanco,v_mercader,v_rodriguez,v_ghione,v_mancini,v_dominguez,v_llargues,v_natiello,v_celesia,v_violini,votos_pcia_cons$resultado,votos_pcia_cons$unanime,votos_pcia_cons$actor,votos_pcia_cons$demandado,votos_pcia_cons$voz,votos_pcia_cons$antecedentes)
colnames(dataset_final) <- c("materia","causa","caratula","fecha","año","trib.origen","nr.jueces","nr.cuestiones","cuestion","v.negri","v.genoud","v.lazzari","v.kogan","v.salas","v.roncoroni","v.pettigiani","v.hitters","v.soria","v.laborde","v.martin","v.pisano","v.vivanco","v.mercader","v.rodriguez","v.ghione","v.mancini","v.dominguez","v.llargues","v.natiello","v.celesia","v.violini","resultado","unanime","actor","demandado","voz","antecedentes")

dataset_final$materia <- toupper(dataset_final$materia)
dataset_final$materia <- factor(dataset_final$materia)

dataset_final$causa <- toupper(dataset_final$causa)
dataset_final$causa <- gsub("\\s|\\.","",dataset_final$causa)

dataset_final$caratula <- toupper(dataset_final$caratula)
dataset_final$caratula <- factor(dataset_final$caratula)

dataset_final$trib.origen <- factor(dataset_final$trib.origen)

dataset_final$resultado <- as.numeric(dataset_final$resultado)

dataset_final$actor <- toupper(dataset_final$actor)
dataset_final$actor <- gsub("^\\s|\\s$|\\.","",dataset_final$actor)

dataset_final$demandado <- toupper(dataset_final$demandado)
dataset_final$demandado <- gsub("^\\s|\\s$|\\.","",dataset_final$demandado)

dataset_final$voz <- toupper(dataset_final$voz)
dataset_final$voz <- gsub("^\\s|\\s$|\\.","",dataset_final$voz)
dataset_final$voz <- factor(dataset_final$voz)

### GUARDAR ###
save(dataset_final,file="dataset_final.RData")
write.csv(dataset_final,file="dataset_final.csv")
