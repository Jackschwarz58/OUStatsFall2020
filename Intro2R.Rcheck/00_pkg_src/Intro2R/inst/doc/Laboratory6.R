## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab6",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
gamma(5.678)
gamma(5) == factorial(4)

## ---- eval = FALSE------------------------------------------------------------
#  dnorm() # make a density plot (the height of the density f(x))
#  pnorm() # the lower tail probability P(X<=x)
#  qnorm() # The x that corresponds to a lower tail area
#  rnorm() # A random sample from the distribution

## ---- eval = FALSE------------------------------------------------------------
#  dunif()
#  dnorm()
#  dgamma()
#  dchisq()
#  dexp()
#  dweibull()
#  dbeta()
#  

## -----------------------------------------------------------------------------
curve(dunif(x, 2,6), xlim=c(2,6))

xcurve <- seq(4,6, length = 1000)
ycurve <- dunif(xcurve, 2, 6)
polygon(x = c(4,xcurve,6), y=c(0,ycurve,0), col = "green")


## -----------------------------------------------------------------------------
library(ggplot2)

normargs <- list(mean = 10, sd = 5)

n <- ggplot(data.frame(x = c(-5,25)), aes(x)) + 
  stat_function(fun = dnorm, args = normargs , geom = "area", col = "black") 
  

n <- n + stat_function(fun = dnorm, args = normargs, geom = "area", fill = "green", alpha = 2,xlim = c(3,8)) 

n <- n + xlab("X") + ylab("Density")
n

## -----------------------------------------------------------------------------
gamargs = list(shape=4, scale=4)
g <- ggplot(data.frame(x=c(6,20)), aes(x)) + 
  stat_function(fun = dgamma, args = gamargs , geom = "area", col = "black") 
  

g <- g + stat_function(fun = dgamma, args = gamargs, geom = "area", fill = "green", alpha = 2,xlim = c(0,6)) 

g <- g + xlab("X") + ylab("Density")
g

## -----------------------------------------------------------------------------
chiargs = list(df = 5)
ch <- ggplot(data.frame(x = c(6,15)), aes(x)) + 
  stat_function(fun = dchisq, args = chiargs , geom = "area", col = "black") 
  

ch <- ch + stat_function(fun = dchisq, args = chiargs, geom = "area", fill = "green", alpha = 2,xlim = c(0,6)) 

ch <- ch + xlab("X") + ylab("Density")
ch


## -----------------------------------------------------------------------------
expargs = list(rate = 1/4)
e <- ggplot(data.frame(x = c(0,10)), aes(x)) + 
  stat_function(fun = dexp, args = expargs , geom = "area", col = "black") 
  

e <- e + stat_function(fun = dexp, args = expargs, geom = "area", fill = "green", alpha = 2,xlim = c(3,6)) 

e <- e + xlab("X") + ylab("Density")
e

## -----------------------------------------------------------------------------
weargs = list(shape = 3,scale =(4)^(1/3) )
w <- ggplot(data.frame(x = c(0.5,4)), aes(x)) + 
  stat_function(fun = dweibull, args = weargs , geom = "area", col = "black") 
  

w <- w + stat_function(fun = dweibull, args = weargs, geom = "area", fill = "green", alpha = 2,xlim = c(0,0.5)) 

w <- w + xlab("X") + ylab("Density")
w

## -----------------------------------------------------------------------------
bargs <- list(shape1 = 3, shape2 = 5 )

b <- ggplot(data.frame(x = c(0,1)), aes(x )) + 
  stat_function(fun = dbeta, args = bargs , geom = "area", col = "black") 
  

b <- b + stat_function(fun = dbeta, args = bargs, geom = "area", fill = "green", alpha = 2,xlim = c(0.2,0.5)) 

b <- b + xlab("X") + ylab("Density")
b


## -----------------------------------------------------------------------------
ggareai2r <- function(gargs,xrange,xarea,dfun){
 

g <- ggplot(data.frame(x = xrange), aes(x)) + 
  stat_function(fun = dfun, args = gargs , geom = "area", col = "black") 
  

g <- g + stat_function(fun = dfun, args = gargs, geom = "area", fill = "green", alpha = 2,xlim = xarea) 

g <- g + xlab("X") + ylab("Density")

print(g)
 
}

## -----------------------------------------------------------------------------
ggareai2r(gargs=list(shape1= 7,shape2=9),xrange = c(0,1),xarea=c(0.4,0.8),dfun = "dbeta")

## -----------------------------------------------------------------------------
ggareai2r(gargs=list(min = 3, max = 10),xrange = c(3,10), xarea = c(4,8),dfun = "dunif")

