## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab13",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
pr <- runif(100)
plot(pr, type = "l", main="Proposal")

## -----------------------------------------------------------------------------
iter <- 10000
init <- 0.01 #inital value to start the simulation
accept <- vector("integer", length = iter)
accept[1]<-1
post<-vector("integer",length=iter)
post[1] <- init # initial value

h<-function(x) x^4*(1-x)^6 # h function proportional to posterior

for(i in 2:iter){
  pr <- runif(1,0,1) # prob between 0,1
  
  ifelse(h(pr)<h(post[i-1]), alpha<-h(pr)/h(post[i-1]), alpha<-1)
     
     
  ifelse(runif(1,0,1)< alpha,
         {post[i] <- pr
         accept[i]<-1}, #if true
         {post[i] <- post[i-1]
         accept[i]<-0}# if false
         )
  
}
plot(post, type="l")

mean(accept) # fraction of iteration accepted by the MCMC sampler

mc <- coda::as.mcmc(post) # USe Coda to make some plots and summary stats

plot(mc)
summary(mc)


## ----eval=FALSE---------------------------------------------------------------
#  library(rjags)
#  binmodel <- " model {
#      x ~ dbinom(p,n) # Likelihood
#      p ~ dbeta(1,1) # Unif(0,1)
#      }
#      "
#  cat(binmodel, file = "binmodel.txt")
#  d<-list(x=4, n=10)
#  m<-jags.model("binmodel.txt", d, n.adapt=999,inits = list(p=0.5), n.chains=3, quiet=TRUE)
#      update(m)
#      q<-coda.samples(m, c("p"), 10000)
#      summary(q)
#  
#  library(ggmcmc)
#     s<- ggmcmc::ggs(q)
#     ggmcmc(s,file = "plots.html")

