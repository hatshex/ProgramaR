# ProgramaR
Curso básico para aprender el lenguaje de programación de R

## Intro
## Orden del día
  * ¿Qué es R?
  * ¿Cómo se instala?
  * Lo básico
  * Acción


### ¿Qué es R?
### ¿Cómo se instala?
Windows
 - Ir a la dirección http://www.r-project.org/ en tu navegador.
 - Click en la opción Download/CRAN. Se va a desplegar un listado de los servidores en donde se puede descargar el ejecutable. De preferencia utilicen https://cran.itam.mx/
 - Click en la opción Download R for Windows.
 - Click en la opción base.
 - Click en el link para descargar la última versión de R. Se descargará un archivo ejecutable (.exe).
 - Cuando se coplete la descarga, dar doble click en el archivo y contestar las preguntas usuales para la instalación.

OS X
 - Ir a la dirección http://www.r-project.org/ en tu navegador.
 - Click en la opción Download/CRAN. Se va a desplegar un listado de los servidores en donde se puede descargar el ejecutable. De preferencia utilicen https://cran.itam.mx/
 - Click en la opción Download R for (Mac) OS X
 - Click en el link de descarga del archivo .pkg file for the latest version of R, under “Files:”, to download it.When the download completes, double-click on the .pkg file and answer the usual questions.

Linux Ubuntu
 - Abrir una terminar y ejecutar los siguientes comandos:
 ``` r
 sudo apt-get -y install r-base r-base-dev
```

### Editores

Hay muchísimos, yo les recomiendo dos.

#### RStudio

Puedes descargar [RStudio](https://www.rstudio.com/products/rstudio/download/) 
siguiendo las instrucciones para cada sistema operativo. RStudio es un IDE (integrated
development environment) para R que incluye consola, editor de texto, memoria de 
gráficos, vista de objetos en el ambiente y otras herramientas útiles para 
desarrollar. En su versión más reciente, también autocompleta código y debuggea
al vuelo.

Aguas con el uso de la memoria RAM de este editor pues abusa bastante y -cuando 
están usando una gran cantidad de datos o procesos muy pesados- RStudio suele 
tronar fácilmente. Buenas prácticas de todos los días: guarden seguido, sigan 
un workflow aunado a controlador de versiones (o algún tipo de backup) y, sobretodo,
creen sus funciones, lógica, algoritmos, con una muestra de sus datos.

#### ESS

[Emacs speaks statistics](http://ess.r-project.org/) es el add-on favorito para
los usuarios de emacs \& R. Soporta la edición de scripts para R, S-plus, SAS,
Stata, OPenBUGS/JAGS. Para los que además ya están acostumbrados al enorme poder
de Emacs, ésta será la mejor opción.

El editor interactivo es muy bueno y casi no tiene overhead de memoria.
