## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab14",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
data(ojuice)
head(ojuice)
library(ggplot2)

g <- ggplot(ojuice, aes(x=Pectin, y=SweetIndex)) 
g <- g + geom_point() + stat_smooth(method = "loess", formula = y~x, col = "Red") 
g <- g +  stat_smooth( method = "lm", formula =y~x+I(x^2)+I(x^3))

print(g)




## -----------------------------------------------------------------------------
library(MCMCpack)

post <- MCMCregress(SweetIndex ~ Pectin + I(Pectin^2) + I(Pectin^3),
                    burnin=1000,
                    mcmc = 10000,
                    data = ojuice)
s<-ggmcmc::ggs(post)
ggmcmc::ggs_histogram(s)


## -----------------------------------------------------------------------------
summary(post)


## -----------------------------------------------------------------------------
post2 <- MCMCregress(SweetIndex ~ Pectin + I(Pectin^2),
                    burnin=1000,
                    mcmc = 10000,
                    data = ojuice)
s2<-ggmcmc::ggs(post2)
ggmcmc::ggs_histogram(s2)
summary(post2)

## -----------------------------------------------------------------------------
post3 <- MCMCregress(SweetIndex ~ Pectin ,
                    burnin=1000,
                    mcmc = 10000,
                    marginal.likelihood = "Laplace",
                    data = ojuice)
s3<-ggmcmc::ggs(post3)
ggmcmc::ggs_histogram(s3)
summary(post3)

## -----------------------------------------------------------------------------
ylm <- lm(SweetIndex ~ Pectin, data = ojuice)
summary(ylm)
s20x::ciReg(ylm)

## -----------------------------------------------------------------------------
geweke.diag(post3)
raftery.diag(post3) # this is made to be used on a pilot mcmc run
#gelman.plot(post3) # this need 2 or more chains

