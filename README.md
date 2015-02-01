##Proyecto Corte Suprema de Buenos Aires

### 1- Objetivo
El objetivo del proyecto en construir una base de datos con las decisiones de los jueces de la Corte Suprema de Buenos Aires sobre los casos que implique una decisión sobre la constitucionalidad o inconstitucionalidad de una ley (nacional o provincial) o decreto.

### 2- Problemas
* No todos los fallos están digitalizados y/o disponibles en el sitio web de la Corte. --- Trabajar con lo que hay.
* Los fallos en la web están embebidos en javascript / JQuery. --- Selenium / Python
* Identificar las decisiones de cada magistrado en el texto del fallo. --- Text Mining
* Gran cantidad de fallos. --- Acotar el criterio de selección.

### 3- Tareas Completadas
1. Scraping de las urls de los fallos completos (Búsqueda = Inconstitucionalidad). Script [VozSimple-Inconstitucionalidad.py][1].
2. Usar las urls para bajar los textos de los fallos y construir el Corpus para el análisis. Script [Corpus_Fallos_Inconst.R][2]
3. Construir base de datos con los detalles de cada fallo.

### 4- Tareas Pendientes
1. Text Mining de los fallos:
  * Identificar la decisión de cada juez.
  * Identificar la desición final de la Corte.
2. Armar la base de datos final.

[1]:https://github.com/fedecarles/Proyecto_SCBA/blob/master/Python/VozSimple-Inconstitucionalidad.py
[2]:https://github.com/fedecarles/Proyecto_SCBA/blob/master/R/Corpus_Fallos_Inconst.R
