#################### SESI?N 1: INTRODUCCI?N A R Y SOFTWARE ####################
###############################################################################
## EJEMPLO 1: TIPOS DE DATOS Y VECTORES

# Crear algunas variables de diferentes tipos:
  
var.hola <- "Hola Mundo"
var.number <- 5L
var.double <- 2.7076
# Si se utilizan paréntesis además de asignar la variable, se imprime el valor
(var.logical <- T)
vector <- c(1,2) #asigna un vector numérico

# Ver tipolog?a de las variables con la funci?n class
class(var.number)
class(var.hola)
class(var.double)
class(var.logical)
typeof(vector)
# La funci?n typeof() regresa el mismo resultado
class(var.logical)
typeof(var.logical)

# Creaci?n de vectores y longitud

a <- c(4, 6, 8, 10,12)
length(a)
b <- c(3, 5, 7, 9)
length(b)

# Indexaci?n de elementos por ubicaci?n. En R, los índices comienzan por 1:
a[1] #4
b[4] #9

# Uni?n de vectores
d = c(a,b)  #c significa Combine
d  # 4  6  8 10 12  3  5  7  9
# Ordenamiento de elementos
d.2 = sort(c(a,b), decreasing = F)
d.2  # 3  4  5  6  7  8  9 10 12

# Generación de rangos. Puede aplicarse a vectores
10:1  # 10  9  8  7  6  5  4  3  2  1
1:1000  # 1 ... 1000
0:10  # 0  1  2  3  4  5  6  7  8  9 10

# Vectores no secuenciales
vector.by2 <- seq(from = 1, to = 10, by =2)  # 1 3 5 7 9
vector.by3 <- seq(1, 10, 3)  #  1  4  7 10

# Rango con n?meros repetidos n veces
rep(5, times = 6)  # 5 5 5 5 5 5

# Observa que hace el siguiente comando con los vectores a y b
rep(a, 2)  # 4  6  8 10 12  4  6  8 10 12
rep(b, 3)  # 3 5 7 9 3 5 7 9 3 5 7 9

# Suma de vectores. R repetir? los valores del vector, hasta alcanzar la dimensi?n requerida
c(1, 2) + c(7, 8, 9, 10)  #  8 10 10 12

# Existen varias operaciones entre vectores, para las cuales los vectores deben ser comformables
a <- c(4, 6, 8, 10,12)
b <- c(3, 5, 7, 9, 12)

a + b  #  7 11 15 19 24
a - b  # 1 1 1 1 0
a*b  # 12  30  56  90 144
a/b  # 1.333333 1.200000 1.142857 1.111111 1.000000
a^2  # 16  36  64 100 144
a1 <- a*0.5 + b^2
a1  # 11  28  53  86 150
a1[1] # 11
###############################################################################
## EJEMPLO 2: MATRICES
# Crear Matrices. 
m <- matrix(1:9, nrow = 3, ncol = 3)
m

# Utilizando ?ndices, se pueden extraer celdas, filas o columnas
m[1,1]
m[,1]  #todas las filas, columna1
m[2,]  #fila2, todas las columnas
m[1:2,3]  #filas 1&2, columna3
# Suma de un vector y matriz
sum.vecmat <- c(1, 2) + m
sum.vecmat # extiende/repite el vector para recorrer la matriz y hacer las ops

# Otro ejemplo de matriz
n <- matrix(2:7, 4, 6)  #(rango, filas, columnas)
n

# Dimensi?n de la matriz
dim(n)  # 4 6

# Extraer subconjuntos condicionales
n > 4  # evalua celda a celda cuales valores son > 4
n[n > 4] #regresa solo los valores > 4: 5 6 7 5 6 7 5 6 7 5 6 7

# Localizar posici?n de las entradas anteriores
which(n > 4)  #regresa la posicion de los indices de las celdas > 4

# Algunas operaciones b?sicas de matrices
# Producto matricial: A %*% B
# Producto elemento a elemento: A*B
# Traspuesta: t(A)
# Determinante: det(A)
# Extraer la diagonal: diag(A)
# Resolver un sistema de ecuaciones lineales (( Ax=b )): solve(A,b)
# Inversa: solve(A)
# Autovalores y autovectores: eigen(A)


###############################################################################
## EJEMPLO 3: Listas y Dataframes

# Listas
milista <- list(nombre = "Pepe", no.hijos = 3, edades.hijos = c(4, 7, 9))
milista

# propiedades de la lista
str(milista)

# Extrayendo elementos de la lista
milista$nombre
milista$edades.hijos

# Creando data frames
x <- 10:21
y <- letters[x]

mydf <- data.frame(edad=x, grupo=y)
str(mydf)

# Extrayendo informaci?n de un dataframe
mydf[1]
mydf[,1]
mydf$edad ## o mydf[,1]
mydf[,2]
mydf$grupo ## o mydf[2]

# Calculando algunos estad?sticos b?sicos
mean(mydf$edad) # 15.5 promedio
var(mydf$edad) ** (1/2)  # stdev 3.605551

# Podemos hacer uso de la funci?n paste() para mejorar la presentaci?n del resultado
paste("La media de la edad es:", mean(mydf$edad))  #parecido a print

# Podemos inspeccionar a detalle el df utilizando `summary`
summary(mydf)
#edad          grupo          
#Min.   :10.00   Length:12         
#1st Qu.:12.75   Class :character  
#Median :15.50   Mode  :character  
#Mean   :15.50                     
#3rd Qu.:18.25                     
#Max.   :21.00                    

# Se puede conocer su dimensi?n
dim(mydf) # 12 2

# Podemos agregar una columna extra con datos
mydf$sexo <- c("H", "M", "H", "M", "H", "H", "M", "H","H","M", "M", "H")
mydf

# Se puede eliminar una columna
(mydf$sexo <- NULL)
mydf

###############################################################################
## EJEMPLO 4: Descarga y lectura de bases de datos
# Revisar la ruta actual de trabajo
getwd()

# Modificar el directorio actual de trabajo
setwd("c:/...") # Depende del usuario donde ubicar su wd
setwd("/Users/clira/Documents/_TR In Progress/Curso Data Science (BEDU)/Fase 2/Módulo 1/Sesión 1")
getwd()

# Lectura de archivos de valores separados por comas (CSV)
read.csv("bestsellers with categories.csv") # El archivo csv debe estar en el directorio de trabajo

# Se debe asignar la base de datos a un objeto
amazon.books <- read.csv("bestsellers with categories.csv")
str(amazon.books)
# retorna primero y ultimos registros de la BD
head(amazon.books); tail(amazon.books) 

# Dimensi?n de la base de datos
dim(amazon.books)  # 550   7

# Tipo de objet
class(amazon.books)  # "data.frame"

# Se pueden leer bases de datos desde una URL
data.url <- read.csv("https://www.football-data.co.uk/mmz4281/2021/SP1.csv")
str(data.url)
head(data.url); tail(data.url)
summary(data.url)

###############################################################################
## RETO 1: LECTURA Y ESCRITURA DE DATOS
###############################################################################
## Reto1: EJEMPLO 1
data1.url<-read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-01/Data/netflix_titles.csv")

str(data1.url) #muestra toda la tabla = SELECT

dim(data1.url) #dimensión  6234   12

class(data1.url)
# Obtener los títulos que se estrenaron después del 2015
df <- data1.url[data1.url$release_year > 2015,]
dim(df)
head(df) 
?write.csv
write.csv(df, file = "/Users/clira/Documents/_TR In Progress/Curso Data Science (BEDU)/Fase 2/Módulo 1/Sesión 1/res.netflix.csv")
## EJEMPLO 5: DESCARGA Y LECTURA DE BASES DE DATOS
# Se instalan de la siguiente manera
install.packages("ggplot2")

# Toda librer?a debe cargarse en la sesi?n de trabajo antes d su uso
library(ggplot2) # Se omite el uso de las comillas

# Otro ejemplo
install.packages("dplyr")
library(dplyr)

# Revisar versi?n de R (no R Studio). Importante para compatibilidad de funciones
version

# Para actualizar se realizar desde el RGui.exe lo siguiente (recuerda que no se hace desde RSTudio)
install.packages("installr", dependencies = TRUE)
library(installr)
updateR()

###############################################################################
## RETO 2: OPERACIONES CON DATAFRAMES

###############################################################################
## EJEMPLO 6: LOOPS Y PSEUDOC?DIGO
# Elevar al cuadrado todas las entradas de un vector
w <- c(2,4,6,8,10)
print("Este loop calcula el cuadrado de los elementos del vector w")
for(i in 1:length(w) ) {
  w.sq <- w[i]**2
  print(w.sq)
}

# Los bucles WHILE comienzan comprobando si una condici?n es TRUE para ejecutar el c?digo
# Al finalizar vuelve a evaluarse la condici?n y el c?digo se ejecuta hasta que sea FALSE
# while(<condicion>) {
#                     c?digo
#                     ...
#             }

# Ejemplo:
count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

# Pseudoc?digo para IF - ELSE

# if(<condicion>) {
## bloque de c?digo
# }

## Continua con el resto del c?digo

# if(<condicion>){
## bloque de c?digo
#               } else {
## otro bloque de c?digo
#                      }

# if(<condition1>) {
## bloque de c?digo
#                 } else if(<condicion2>) {
## otro bloque de c?digo
#                                        } else {
## otro bloque de c?digo
#                                               }

# Ejemplo
(x <- runif(1, 0, 10)) ## creamos un n?mero aleatorio entre 0 y 10

if(x > 5) {
  y <- TRUE
  print(paste(y, ", x=", round(x,2) ,"> 5"))
} else {
  y <- FALSE
  print(paste(y, ", x=", round(x,2) ," < 5"))
}

# Estamos asignando un valor a una variable en funci?n del valor de otra.
#Lo que se debe tener en cuenta es que la condici?n debe retornar un valor TRUE o FALSE.

###############################################################################
## RETO 3: LOOPS

