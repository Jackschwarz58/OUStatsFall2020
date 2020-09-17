## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab5",package = "Intro2R")

# create rmd link

library(Intro2R)



## ----eval = FALSE-------------------------------------------------------------
#  dbinom() # individual probabilites
#  pbinom() # lower tail probability P(Y<=y) (inverse of qbinom)
#  qbinom() # quantile for given lower tail prob (inverse of pbinom)
#  rbinom() # random sample from a binomial distribution

## ---- eval = FALSE------------------------------------------------------------
#  dbinom(x,size = 1,prob) # Bernoulli
#  dbinom(x, size = n, prob) # Binomial
#  dnbinom(x,size,prob) # neg binomial
#  dgeom(x,prob) # geometric
#  dmultinom(x,prob) # multinomial, x and prob are vectors
#  dpois(x,lambda) # poisson
#  dhyper(x,m,n,k) # hypergeometric

## -----------------------------------------------------------------------------
p <- dbinom(0:10, size = 10, prob = 0.6)

names(p)= 0:10
ind <- which(0:10==6:8)

coll <- rep(1,11)
coll[ind]<-3

barplot(p, col = coll, xlab = "Number of successes")

## -----------------------------------------------------------------------------
p <- dnbinom(0:15, 3,0.6) # 15 is picked as a convenient upper limit
names(p) <- 0:15 # starts at 0 becasue X=Y-1

ind <- which(0:15 > 6)
coll <- rep(1,16)
coll[ind] <- 3
barplot(p, col = coll, xlab = "Number of failures till the 3rd success")

## -----------------------------------------------------------------------------
p <- dgeom(0:10,0.6) # 10 is picked as a convenient upper limit
names(p) <- 0:10 # starts at 0 becasue X=Y-1

ind <- which(0:10 <3)
coll <- rep(1,11)
coll[ind] <- 3
barplot(p, col = coll, xlab = "Number of failures till the 1st success")

## -----------------------------------------------------------------------------
p <- dpois(0:15, lambda=4)
names(p) = 0:15

ind= which(0:15 >= 6)
coll = rep(1,16)
coll[ind] <- 3
barplot(p, col = coll,xlab = "Number of successes")

## -----------------------------------------------------------------------------
p<-dhyper(0:10, m=20, n=30-20, k =10)
names(p) <- 0:10

ind <- which(0:10 > 4 & 0:10 < 9)
coll <- rep(1,11)
coll[ind]<-3
barplot(p, col = coll, xlab = "Number of white balls")

