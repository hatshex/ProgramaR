# Instralar paquetes y dependencias
if(!require(dplyr,quietly = TRUE, warn.conflicts = FALSE)){
  install.packages('dplyr', 
                   dependencies = TRUE, 
                   repos = "http://cran.us.r-project.org")
  library(dplyr, quietly = TRUE, warn.conflicts = FALSE)
}


if(!require(maps,quietly = TRUE, warn.conflicts = FALSE)){
  install.packages('maps', 
                   dependencies = TRUE, 
                   repos = "http://cran.us.r-project.org")
  library(maps, quietly = TRUE, warn.conflicts = FALSE)
}



#Cargar librerías
library(tidyr)
library(dplyr)
library(ggplot2)
library(nycflights13)

help(head)

head(flights)

class(flights)
str(flights)

summary(flights)

# Filtra el data frame con base en las distintas variables que tengas.
filter(flights, month == 10, day == 31)

# Filtra y selecciona en función del número de renglón.
slice(flights, 1:20)

# Ordena los renglones del data frame en función de distintas variables a elegir.
arrange(flights, year, desc(month), day)

# Selecciona columnas de un data frame, para quedarnos con un subconjunto de las mismas (como en un select de SQL)
select(flights, year, month, day, carrier, origin, dest)
select(flights, year:day)
select(flights, -year)


# La manera más limpia de renombrar variables.
#rename(flights, dest = origin)
rename(flights, mes = month)


# Quita los duplicados del data frame.
distinct(select(flights, origin, dest))

# Genera nuevas variables, se pueden usar el resto de los renglones para crear nuevas variables:

mutate(flights,
       speed = distance / air_time * 60,
       speedx2 = speed*2
)

# Sirve para aplicar funciones a los renglones de la base de datos, particularmente útil con group_by para agrupaciones.
summarise(flights,
          delay = mean(dep_delay, na.rm = TRUE))


# Crea 2 histogramas (Llegadas, Salidas) de vuelos de 2013 con retrasos
par(mfrow=c(1,2))
hist(flights$arr_delay, main = "Llegadas de vuelos con retraso")
hist(flights$dep_delay, main = "Salidas de vuelos con retraso")



ggplot(data = flights, mapping = aes(x=time_hour)) +
  geom_histogram()

ggplot(data = flights, mapping = aes(x=time_hour)) +
  geom_histogram(bins = 60, color = "white")


ggplot(data = flights, mapping = aes(x=time_hour)) +
geom_histogram(bins = 100, color = "white", fill = "steelblue")


# Número de vuelos por aerolínea
ggplot(data = flights, mapping = aes(x = carrier)) +
  geom_bar(fill = "gray")
 
# Gráfica de dispersión de tiempo vs llegadas con retraso de 2013
ggplot(data = flights , aes(x=time_hour, y= arr_delay)) +
  geom_point()

ggplot(data = flights, mapping = aes(x=time_hour, y= arr_delay)) + 
  geom_point(alpha = 0.2)

ggplot(data = flights, mapping = aes(x=time_hour, y= arr_delay)) + 
geom_line()

flights <- flights %>%
  # creating a new variable to classify if a flight is on time or delayed
  mutate(dep_type = ifelse(dep_delay < 5, "on time", "delayed"))
# plot a bar chart by month
qplot(x = month, fill = dep_type, data = flights, geom = "bar", main = "Frequency of Delayed vs On Time Arrivals by Month")

# Listado de aerolíneas
airlines

# Listado de aeropuerts
airports

# Vuelos por aerolíneas
flights_table <- flights %>% 
  group_by(carrier) %>% 
  summarize(number = n())
flights_table



# Inner Joins
flights_namedports <- flights %>% 
  inner_join(airports, by = c("origin" = "faa"))





flights_namedcarrier <- flights_namedports %>% 
  inner_join(rename(airlines, aerolinea = carrier, nombre=name), by = c("carrier" = "aerolinea"))


ggplot(data = flights_namedports, mapping = aes(x = carrier, fill = name)) +
  geom_bar()

ggplot(data = flights_namedports, mapping = aes(x = carrier, fill = name)) +
  geom_bar(position = "dodge")
