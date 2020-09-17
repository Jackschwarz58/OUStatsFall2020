## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab12",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
n <- 10
x <- 4
alpha = 0.05
data <- rep(c(1,0),c(x,n-x))
myp <- function(data, indices){
  d<-data[indices]
  phat<-mean(d) # number of successes/n
}
out<-boot::boot(data, myp,R = 10000)
boot::boot.ci(out,conf = 1-alpha,type = "perc")

## -----------------------------------------------------------------------------
p = dbinom(0:10, size = 10, prob = 1/2)

names(p) = 0:10

coll <- rep(3,11)
barplot(p, col = coll, main = "Distribution of x with p=1/2")


## -----------------------------------------------------------------------------

p = dbinom(0:10, size = 10, prob = 1/2)

names(p) = 0:10

index = c(1,2,10,11)

coll = rep(3,11)
coll[index]<-1
coll[5] <- 2
barplot(p, col = coll, 
        main = "Distribution of x with p=1/2\n Rejection regions on x axis, bars in Black",
        xlab = "Number of successes",
        ylab = "Probability")



## -----------------------------------------------------------------------------
round(p[p<p[5]],4) # more extreme
round(p[p<=p[5]],4) # as or more extreme

## -----------------------------------------------------------------------------
sum(p[p<=p[5]])
1-p[6]

## -----------------------------------------------------------------------------
n <- 10
x <- 4
alpha = 0.0214844
data <- rep(c(1,0),c(x,n-x))
myp <- function(data, indices){
  d<-data[indices]
  phat<-mean(d) # number of successes/n
}
out<-boot::boot(data, myp,R = 10000)
boot::boot.ci(out,conf = 1-alpha,type = "norm")

## -----------------------------------------------------------------------------
p <- dbinom(0:10,size = 10, prob=1/2)
names(p) <- 0:10

pa <- dbinom(0:10,size = 10, prob = 3/4)
names(pa) <- 0:10

coll <- rep(3,11)
colla <- rep(4,11)

h<-barplot(p, col = coll , main = "p=1/2, 3/4", ylim =c(0, 1.2*max(p,pa)))
barplot(pa, col = rgb(1,0,1,0.2), add=TRUE)
lines(h,p)
lines(h,pa)

## -----------------------------------------------------------------------------
mypow = function(p,A=2:8){
  1-sum(dbinom(A,10,p))
}

pa = as.list(x=seq(0,1, length = 1000))
pow <- purrr::map(pa, ~mypow(.x))
plot(x=pa,
     y=pow, 
     xlim=c(0,1), 
     xlab = "Alternate Probabiity",
     ylab = expression(1-beta),
     main = "Power over values of pa",
     type = "l",
     lwd = 2
     )
abline(v=1/2, lwd =2, col = "Blue")

## -----------------------------------------------------------------------------
layout(matrix(1:6,nrow= 2, ncol = 3, byrow = TRUE))
plotp = function(Astar){
mypow = function(p,A=Astar){
  1-sum(dbinom(A,10,p))
}

pa = as.list(x=seq(0,1, length = 1000))
pow <- purrr::map(pa, ~mypow(.x))
plot(x=pa,
     y=pow, 
     xlim=c(0,1), 
     xlab = "Alternate Probabiity",
     ylab = expression(1-beta),
     main = "Power over values of pa",
     type = "l",
     lwd = 2
     )
text(0.5,0.8, paste0("A=",Astar[1], ",...,", Astar[length(Astar)]))
}

plotp(2:8)
plotp(3:7)
plotp(4:6)
plotp(3:8)
plotp(4:8)
plotp(5:8)

## -----------------------------------------------------------------------------
curve(
  dt(x,
     ncp=4,
     df = 10,
     ), 
    xlim = c(4-3,4+5),
    main = "The non-central t distribution"
  )

## -----------------------------------------------------------------------------
alpha = 0.05
n  = 11
mua = 4
sigma = 10
t = qt(1-alpha/2, n-1)
power = pt(-t, df = n-1, ncp = sqrt(n)*mua/sigma) +
  1 - pt(t, df = n-1, ncp = sqrt(n)*mua/sigma)
power

# The function estimates sigma by sd -- we will do the reverse
out <- power.t.test(n=n,delta = mua,sd = sigma,sig.level = 0.05,type = "one.sample" )
out$power

curve(power.t.test(n=n,delta = x,sd = sigma,sig.level = 0.05,type = "one.sample" )$power,xlim = c(-10,10))

## ---- eval = FALSE------------------------------------------------------------
#  power.prop.test()
#  power.prop.test(n = NULL, p1 = NULL, p2 = NULL, sig.level = 0.05,
#                  power = NULL,
#                  alternative = c("two.sided", "one.sided"),
#                  strict = FALSE, tol = .Machine$double.eps^0.25)
#  

## ----eval = FALSE-------------------------------------------------------------
#  power.t.test(n = NULL, delta = NULL, sd = 1, sig.level = 0.05,
#               power = NULL,
#               type = c("two.sample", "one.sample", "paired"),
#               alternative = c("two.sided", "one.sided"),
#               strict = FALSE, tol = .Machine$double.eps^0.25)

## ----eval = FALSE-------------------------------------------------------------
#  install.packages("pwr")

