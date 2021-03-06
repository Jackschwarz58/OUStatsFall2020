## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(Intro2R)

## ---- eval=FALSE--------------------------------------------------------------
#  data = read.csv(file.choose())

## -----------------------------------------------------------------------------
v <- c(1,4,5)
v

## -----------------------------------------------------------------------------
print(v)

## -----------------------------------------------------------------------------
v <- c()
v

## -----------------------------------------------------------------------------
v <- vector(mode = "numeric", length = 10L)
v

## -----------------------------------------------------------------------------
v <- LETTERS
v
v[1]

## -----------------------------------------------------------------------------
v[2:4]

## -----------------------------------------------------------------------------
v[c(1,3,5,6,7)]

## -----------------------------------------------------------------------------
v[4]<-"a string of letters"
v

## -----------------------------------------------------------------------------
print("Mode before is:")
mode(v)
v[26] <- 1
v
print("Mode after is:")
mode(v)

## -----------------------------------------------------------------------------
i <- 1:10
v <- 2*i + 10 # i is a vector -- one line calculation
v

## -----------------------------------------------------------------------------
v <- vector(mode = "numeric", length = 10)
for(i in 1:10){
  v[i]<-2*i +10
}
v


## -----------------------------------------------------------------------------
i <- 1 # initialize i to get the loop started
v <- vector(mode = "numeric", length = 10)
while(i <= 10){
  v[i] <- 2*i + 10
  i <- i + 1 # increment i by 1
}
v

## -----------------------------------------------------------------------------
v <- vector(mode = "numeric", length = 10)
for(i in 1:10){
  if(i<=5){
  v[i]<-2*i +10 # only made when i<=5
  }
  else{
    v[i] <- 3*i +10 # only made when i!<=5 (not less than or equal to 5)
  }
}
v

## -----------------------------------------------------------------------------
l <- list(a = 1:20, b = letters, c = rnorm(10))
l

## -----------------------------------------------------------------------------
l <- vector(mode = "list", length = 3)

l

## -----------------------------------------------------------------------------
l[[1]] <- 1:10
l[[2]] <- letters
l[[3]] <- rnorm(4)
l
names(l) <- c("a", "b", "c")
l

## -----------------------------------------------------------------------------
l[[2]]

## -----------------------------------------------------------------------------
l$b
typeof(l$b)

## -----------------------------------------------------------------------------
l[2]
typeof(l[2])

## -----------------------------------------------------------------------------
l["b"]

all.equal(l["b"], l$b) # notice mismatch

l[["b"]]

all.equal(l[["b"]], l$b) # same

## -----------------------------------------------------------------------------
mat <- matrix(NA, 
              nrow= 10,
              ncol = 5,
              byrow = TRUE
              )
mat

## -----------------------------------------------------------------------------
mat <- matrix(1:50, 
              nrow = 10, 
              ncol = 5, 
              byrow = TRUE
              )
mat

## -----------------------------------------------------------------------------
colnames(mat) <- letters[1:5]
rownames(mat) <- LETTERS[1:10]
mat

## -----------------------------------------------------------------------------
mat <- matrix(1:50, 
              nrow= 10, 
              ncol =5, 
              dimnames = list(LETTERS[1:10], letters[1:5]))
mat

## -----------------------------------------------------------------------------
mat[1,3]

## -----------------------------------------------------------------------------
mat[2,] # second row

mat[,3] # 3rd column

## -----------------------------------------------------------------------------
mat[,3, drop = FALSE]

## -----------------------------------------------------------------------------
mat[-2,-3]

## -----------------------------------------------------------------------------
mat[,"c"]

## -----------------------------------------------------------------------------
df <- data.frame(a=1:26, b = letters, c = LETTERS, d= rnorm(26))
head(df)

## -----------------------------------------------------------------------------
df[2]
df["b"]
str(df[2])

## -----------------------------------------------------------------------------
df2 <- df[c(2,3)]
str(df2)


l2 <- df2[[2]] # selects a component
str(l2) # a vector 

df3 <- df2[2] # selects a component and returns a data frame
str(df3)


## -----------------------------------------------------------------------------
str(df)
df[1:4,]

str(df[1:4,])

## ----fig.width=6--------------------------------------------------------------
library(ggplot2)
mpg
with(mpg, plot(displ, cyl))


## -----------------------------------------------------------------------------
g <- ggplot(data = mpg)
g

## ----ggplot,fig.width = 8, fig.fullwidth = TRUE-------------------------------
g <- g + geom_point(aes(x = displ, y = cty ,color = year )) + ggtitle("City mpg versus engine size")
g

## -----------------------------------------------------------------------------
g <- ggplot(mpg)

g <- g + geom_boxplot(aes(x = drv, y = hwy, fill = drv )) 
g

## ----fig.width = 8, fig.fullwidth = TRUE--------------------------------------
g <- ggplot(mpg)

g <- g + geom_boxplot(aes(x = drv, y = hwy, fill = manufacturer ))
g

## ----eval=FALSE---------------------------------------------------------------
#  myf <- function(){
#  
#  }

## -----------------------------------------------------------------------------
myfirstfun

## -----------------------------------------------------------------------------
myfirstfun(x = 1:30, col = "Red")

## -----------------------------------------------------------------------------
obj <- myfirstfun(x = 1:30, col = "Red")
obj$x

## -----------------------------------------------------------------------------
myimprovedfun <- function(x, ...) { # key function "function(), name of function , ... sends extra arguments to plot
  y <- x^2 #object on the right x^2,  name on the left "y"
  df <- data.frame(x=x, y= y)
  g <- ggplot(df)
  g <- g + geom_point(aes(x = x, y=y, ...)) + ggtitle("Improved function")
  print(g)
  return(list(x=x,y=y, sumdf = summary(df))) # return will stop execution of code and release argument to the command line
}


## -----------------------------------------------------------------------------
myimprovedfun(x = 1:40, col = "Red" )

## -----------------------------------------------------------------------------
library(dplyr)
sub <- select(ddt, c(LENGTH,WEIGHT))
head(sub)

## -----------------------------------------------------------------------------
filter(ddt, WEIGHT > 2000)

## -----------------------------------------------------------------------------
ddt %>% filter(., WEIGHT > 2000)

## -----------------------------------------------------------------------------
ddt %>% filter(WEIGHT > 2000) %>% select(LENGTH) 

## -----------------------------------------------------------------------------
obj <- ddt %>% arrange(desc(LENGTH)) 
head(obj)

## -----------------------------------------------------------------------------
by_SPECIES <- ddt %>% group_by(SPECIES)
head(by_SPECIES)
obj2 <- by_SPECIES %>% arrange(desc(LENGTH), .by_group =TRUE)
tail(obj2)

## -----------------------------------------------------------------------------
ddt2 <- ddt %>% mutate(DENSITY = LENGTH/WEIGHT)
head(ddt2)

## ----eval=FALSE---------------------------------------------------------------
#  library(data.table)
#  flightfile <-"https://raw.githubusercontent.com/Rdatatable/data.table/master/vignettes/flights14.csv"
#  }
#  flights <- fread(flightfile)
#  usethis::use_data(flights)

## -----------------------------------------------------------------------------
library(data.table)
ddt2<-copy(ddt) # ddt is locked in the package
DT <- setDT(ddt2) 
class(DT)

## -----------------------------------------------------------------------------
DT[WEIGHT > 2000]

## -----------------------------------------------------------------------------
DT[WEIGHT > 2000, LENGTH]

## -----------------------------------------------------------------------------
DT[WEIGHT > 2000, LENGTH, by =SPECIES]

## -----------------------------------------------------------------------------
class(flights)
dim(flights)
names(flights)
flights[,.(dest = dest , distance = distance)]

