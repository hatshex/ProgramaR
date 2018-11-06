# Lo básico
## 1. El espacio de trabajo (Workspace)
#### 1.1 Directorio de trabajo

El directorio de trabajo o *working directory* es el folder en tu computadora en
el que estás trabajando en ese momento. Cuando se le pide a R que abra un archivo
o guarde ciertos datos, R lo hará a partir del directorio de trabajo que le hayas
fijado.

Para saber en qué directorio te encuentras, se usa el comando `getwd()`.

```{r}
getwd()
```

Para especificar el directorio de trabajo, se utiliza el comando `setwd()` en la consola. Y volvemos a 

```{r, eval=F}
setwd("D:\\Proyectos\\ProgramaR")
getwd()
```

Con lo que acabamos de hacer, R buscará archivos o guardará archivos en el folder `/Users/moni/Repos/aprendeR`. En R también es posible navegar a partir de 
el directorio de trabajo. Como siempre, 
- "../un\_archivo.R" le indica a R que busque un folder arriba del actual 
directorio de trabajo por el archivo *un\_archivo.R*.
- "datos/otro\_archivo.R" hace que se busque en el directorio de trabajo, dentro 
del folder *datos* por el archivo *otro\_archivo.R*

#### 1.2 Ejemplos básicos

La consola permite hacer operaciones sobre números o caracteres (cuando tiene
sentido).

```{r}
# Potencias, sumas, multiplicaciones
> 2^3 + 67 * 4 - (45 + 5)
[1] 226

# Comparaciones
> 56 > 78 
[1] FALSE

> 34 <= 34
[1] TRUE

> 234 < 345
[1] TRUE

> "hola" == "hola"
[1] TRUE

> "buu" != "yay"
[1] TRUE

> # modulo
> 10 %% 4 
[1] 2

```

Estas operaciones también pueden ser realizadas entre vectores

```{r}
> x <- -1:12
> x
 [1] -1  0  1  2  3  4  5  6  7  8  9 10 11 12
 
> x + 1
 [1]  0  1  2  3  4  5  6  7  8  9 10 11 12 13
 
> 2 * x + 3
 [1]  1  3  5  7  9 11 13 15 17 19 21 23 25 27
 
> x %% 5 #-- is periodic
 [1] 4 0 1 2 3 4 0 1 2 3 4 0 1 2
 
> x %/% 5
 [1] -1  0  0  0  0  0  1  1  1  1  1  2  2  2

```

Hay más de una manera de llamar a un vector:
```{r}
> seq(1,9,by=5)
[1] 1 6

> seq(1,9,length.out=5)
[1] 1 3 5 7 9

> 1:3
[1] 1 2 3

> c(1,2,1:5)
[1] 1 2 1 2 3 4 5

```

#### 1.3 Comandos útiles

Para listar lso objetos que están en el espacio de trabajo

```{r}
ls()
```

Para eliminar todos los objetos en un workspace

```{r}
rm(list = ls()) # se puede borrar solo uno, por ejemplo, nombrándolo
ls()
```

También se puede utilizar\/guardar la historia de comandos utilizados

```{r, eval=F}
history()
history(max.show = 5)
history(max.show = Inf) # Muestra toda la historia
# Se puede salvar la historia de comandos a un archivo
savehistory(file = "mihistoria") # Por default, R ya hace esto 
# en un archivo ".Rhistory"
# Cargar al current workspace una historia de comandos en particular
loadhistory(file = "mihistoria")
```

Es posible también guardar el workspace -en forma completa- en un archivo con el 
comando `save.image()` a un archivo con extensión *.RData*. Puedes guardar una 
lista de objetos específica a un archivo *.RData*. Por ejemplo:

```{r, eval=F}
x <- 1:12
y <- 3:45
save(x, y, file = "ejemplo.RData") #la extensión puede ser arbitraria.
```

Después puedo cargar ese archivo. Prueba hacer:

```{r, eval=F}
rm(list = ls()) # limpiamos workspace
load(file = "ejemplo.RData") #la extensión puede ser arbitraria.
ls()
```

Nota como los objetos preservan el nombre con el que fueron guardados.

#### 1.4 Librerías

R puede hacer muchos análisis estadísticos y de datos. Las diferentes capacidades
están organizadas en paquetes o librerías. Con la 
[instalación estándar](https://github.com/animalito/aprendeR/blob/master/lecture_01/0_instalacion.pdf)
se instalan también las librerías más comunes. Para obtener una lista de
todos los paquetes instalados se puede utilizar el comando `library()` en la consola.

Existen una gran cantidad de paquetes disponibles además de los incluidos por default.

##### CRAN

CRAN o *Comprehensive R Archive Network* es una colección de sitios que contienen
exactamente el mismo material, es decir, las distribuciones de R, las extensiones,
la documentación y los binarios. El master de CRAN está en Wirtschaftsuniversität Wien
en Austria. Éste se "espeja" (*mirrors*) en forma diaria a muchos sitios alrededor
del mundo. En la [lista de espejos](https://cran.r-project.org/mirrors.html) se puede
ver que para México están disponibles el espejo del ITAM, del Colegio de Postgraduados (Texcoco) y
Jellyfish Foundation. 

Los espejos son importantes pues, cada vez que busquen instalar paquetes, se les
preguntará qué espejo quieren utilizar para la sesión en cuestión. Del espejo que 
selecciones, será del cuál R *bajará* el binario y la documentación.

Del CRAN es que se obtiene la última versión oficial de R. Diario se actualizan los espejos.
Para más detalles consultar el [FAQ](https://cran.r-project.org/doc/FAQ/R-FAQ.html).

Para contribuir un paquete en CRAN se deben seguir las instrucciones [aquí](https://cran.r-project.org/web/packages/policies.html).

En general, el proceso que seguimos para instalar algún paquete directo del CRAN es (ejemplo):

```{r, echo=T, eval=F}
install.packages("dplyr")
library(dplyr)
```


##### Github

Git es un controlador de versiones muy popular para desarrollar software. Cuando 
se combina con [GitHub](https://github.com/) se puede compartir el código con el
resto de la comunidad. Éste controlador de versiones es el más popular entre
los que contribuyen a R. Muchos problemas a los que uno se enfrenta alguien ya
los desarrolló y no necesariamente publicó el paquete en CRAN. Para instalar 
algún paquete desde GitHub, se pueden seguir las instrucciones siguientes

```{r, eval = FALSE}
install.packages("devtools")
devtools::install_github("username/packagename")
```

Donde `username` es el usuario de Github y `packagename` es el nombre del 
repositorio que contiene el paquete. Cuidado, 
no todo repositorio en GitHub es un paquete. Para más información ver el 
capítulo [Git and GitHub](http://r-pkgs.had.co.nz/git.html)  en 
\textcite{wickham2015r}.

##### Otras fuentes 

Otros lugares en donde es común que se publiquen paquetes es en [Bioconductor](https://www.bioconductor.org/)
un projecto de software para la comprensión de datos del genoma humano. 

#### 1.5 Scripting

R es un intérprete. Utiliza un ambiente basado en línea de comandos. Por ende, 
es necesario escribir la secuencia de comandos que se desea realizar a diferencia
de otras herramientas en donde es posible utlizar el mouse o menús. 

Aunque los comandos pueden ser ejecutados directamente en consola una única vez,
también es posible guardarlos en archivos conocidos como *scripts*. Típicamente,
utilizamos la extensión **.R** o **.r**. En RStudio, `CTRL + SHIFT + N` abre 
inmediatamente un nuevo editor en el panel superior izquierdo.

Se puede *ir editando* el script y corriendo los comandos línea por línea con `CTRL + ENTER`. 
Esto también aplica para *correr* una selección del texto editable. 

Es posible también correr todo el script

```{r, eval=F}
source("foo.R")
```

O con el atajo `CTRL + SHIFT + S` en RStudio.

Para enlistar algunos shortcuts comunes en RStudio presiona `ALT + SHIFT + K`. 
De la misma manera, si utilizas Emacs + ESS, existen múltiples atajos de teclado
para realizar todo mucho más eficientemente. Estudiarlos no es tiempo perdido.

#### 1.6 Ayuda \& documentación

R tiene mucha documentación. Desde la consola se puede accesar a la misma. 

Para ayuda general,

```{r, eval=F}
help.start()
```

Para la ayuda de una función en especifico, por ejemplo, si se quiere graficar 
algo y sabemos que existe la funcion `plot` podemos consultar
fácilmente la ayuda.

```{r, eval=F}
help(plot)
# o tecleando directamente
?plot
```

El segundo ejemplo se puede extender para buscar esa función en todos los paquetes
que tengo instalados en mi ambiente al escribir `??plot`.

La documentación normalmente se acompaña de ejemplos. Para *correr* los ejemplos
sin necesidad de copiar y pegar, prueba

```{r, eval=F}
example(plot)
```

Para búsquedas más comprensivas, se puede buscar de otras maneras:

```{r, eval=F}
apropos("foo") # Enlista todas las funciones que contengan la cadena "foo"
RSiteSearch("foo") # Busca por la cadena "foo" en todos los manuales de ayuda 
# y listas de distribución.
```
