## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab10",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
library(stats4)
#summary(y)
y<-c(151,146,120,192,161,155,113,187,171,172) # frequency over 10 cats
 
nll <- function(lambda){
  -sum(stats::dpois(y,lambda, log=TRUE))
}

mle(nll,
    nobs = length(y),
    start = list(lambda = 120),
    lower = 100,
    upper = 200,
    method = "Brent")

## -----------------------------------------------------------------------------
y<- c(10,12,9,8,11,13,8)

nll <- function(mu,sigma){
  -sum(stats::dnorm(y, mu, sigma, log = TRUE))
}

mle(nll,start = list(mu=10,sigma=(13-8)/4),nobs = length(y))

