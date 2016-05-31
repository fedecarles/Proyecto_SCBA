#Proyecto Corte Suprema de Buenos Aires

### 1- Objetivo
El objetivo del proyecto en construir una base de datos la Corte Suprema de Buenos Aires que capture las decisiones individuales de cada magistrado y el resultado final de la sentencia, entre otras informaciones. 

### 2- Problemas
* No todos los fallos están digitalizados y/o disponibles en el sitio web de la Corte. --- Trabajar con lo que hay (aprox. 2K)
* No todas las decisiones son identificables automaticamente.
* Muchos fallos no explicitan de modo directo a quien favorecen (a favor del actor o del demandado, etc.). Obtener ese dato require un análisis del contenido aun más complejo que la obtención de las decisiones individuales.

### 3- Tareas Completadas
1. ~~Scraping de las urls de los fallos completos (Búsqueda = Inconstitucionalidad).~~ Script: [urls_fallos.py][1] y [urls_clean.py][2]
2. ~~Usar las urls para bajar los textos de los fallos y construir el Corpus de texto.~~ Script: [scrape_urls.R][3]
3. ~~Extraer datos generales de los fallos~~ Script: [get_votes][4] Data: [datos_fallos.RData][5]
4. ~~Extraer las decisiones individuales de los magistrados.~~ Data: [votos.RData][6]

### 4- Tareas Pendientes
1. Identificar el resultdos final de la sentencia. ¿A quien favorece?
2. Armar la base de datos final.

[1]: https://github.com/fedecarles/Proyecto_SCBA/blob/master/scrape%20urls/urls_fallos.py
[2]: https://github.com/fedecarles/Proyecto_SCBA/blob/master/scrape%20urls/urls_clean.py
[3]: https://github.com/fedecarles/Proyecto_SCBA/edit/master/r/scrape_urls.R
[4]: https://github.com/fedecarles/Proyecto_SCBA/blob/master/r/get_votes.R
[5]: https://github.com/fedecarles/Proyecto_SCBA/blob/master/r/Data/datos_fallos.RData
[6]: https://github.com/fedecarles/Proyecto_SCBA/blob/master/r/Data/votos.RData
