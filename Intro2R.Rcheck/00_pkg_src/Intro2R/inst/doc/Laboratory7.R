## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab7",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
library(ggplot2)
g <- ggplot(data.frame(x=c(-4,4)), aes(x)) + stat_function(geom="line",fun = "dt", args=list(df=9), color = "blue") 
g<-g+ stat_function(geom="line",fun = "dt", args=list(df=99), color = "green") + xlab("T") + ylab("Density")
g

## -----------------------------------------------------------------------------
pop <- 1:100

set.seed(20) # used to make the same sample
sample(x = pop,size = 10,replace = TRUE,prob = rep(1/100,100))


## -----------------------------------------------------------------------------
iter = 10000 # nu of iterations
n = 10 # sample size
matf <- matrix(NA, nr=n, nc = iter) # matrix to hold samples (no replacement)
matt <- matf # second matrix same size (With replacement)
matf2 <- matf # no replacement second pop
matt2 <- matf # replacement secod pop
pop = 1:1000  # first pop to sample from (large pop)
pop2 = 1:12 # second pop to sample from (small pop)

for(i in 1:iter){ # for loop to iterate
  matf[,i] <- sample(x=pop,size = n, replace = FALSE) # fill columns
  matt[,i] <- sample(x=pop,size=n,replace=TRUE)
  matf2[,i] <- sample(x=pop2, size = n, replace = FALSE)
  matt2[,i] <- sample(x=pop2, size = n, replace = TRUE)
 }
mnf <- apply(matf, 2, mean) # apply "mean" to columns (2) of the matf matrix
mnt <- apply(matt, 2, mean)

mnf2 <- apply(matf2,2,mean)
mnt2 <- apply(matt2, 2, mean)

stdf <- summary(mnf)
stdt <- summary(mnt)

stdf2 <- summary(mnf2)
stdt2 <- summary(mnt2)

layout(matrix(c(1,2,3,4), nrow=2,ncol = 2, byrow=TRUE))
hist(mnf,main = "Large pop.", xlab = "no replacement, sample mean")
hist(mnt,main = "Large pop.", xlab = "replace, sample mean")


hist(mnf2,xlim = c(0,10),main = "Small pop.", xlab = "no replacement, sample mean")
hist(mnt2,xlim = c(0,10),main = "Small pop.", xlab = "replace, sample mean")



## -----------------------------------------------------------------------------
stdf2 # Summary of sample means No replacement
sd(mnf2) # sd 
IQR(mnf2)/sd(mnf2) # test for Normality
#---------------------------
stdt2 # Summary of sample means replacement
sd(mnt2)
IQR(mnt2)/sd(mnt2)

