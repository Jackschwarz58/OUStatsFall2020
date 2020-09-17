## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  warning = FALSE,
  message = FALSE
)

# directory to Lab
dirdl <- system.file("Lab2",package = "Intro2R")

# create rmd link

library(Intro2R)
dir(dirdl)


## -----------------------------------------------------------------------------
d <- ddt$DDT
z <- (d-mean(d))/sd(d)
head(z)

## -----------------------------------------------------------------------------
zmat<-scale(ddt$DDT) # scale makes a matrix of z values
z<-zmat[,1] # take the column to form a vector
head(z)

## -----------------------------------------------------------------------------
mn <- mean(ddt$DDT)
sdd <- sd(ddt$DDT)
mp<-c(-1,1)
k<-2

mn+mp*k*sdd


## -----------------------------------------------------------------------------
ddl2<-ddt[abs(z)<2,"DDT"]
length(ddl2)/length(ddt$DDT)*100

## -----------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
mn <- mean(ddt$LENGTH)
sdd <- sd(ddt$LENGTH)
ddt <- ddt %>% mutate( z = (LENGTH-mn)/sdd, 
                       Far = ifelse(abs(z)> 3, "Outlier", 
                                    ifelse(abs(z)>=2 & abs(z)<=3, 
                                           "Posiible Out.", "MAIN")))
g <- ggplot(ddt, aes(x = LENGTH)) + geom_dotplot(aes(fill = Far),binwidth = 1/5*sdd)
g <- g + geom_density(aes(y = ..count..))
g <- g + labs(title = "LENGTH data categorized by outlier status using z")
g

## -----------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
mn <- mean(ddt$LENGTH)
sdd <- sd(ddt$LENGTH)
ddt <- ddt %>% mutate( Lcut = cut(LENGTH, c(min(LENGTH)-1, 
                                            seq(mn-3*sdd, mn+3*sdd, by = sdd), max(LENGTH)),
                                  labels = c("Outlier","Possible Out","Main","Main", "Main","Main", "Possible Out", "Outlier")))
g <- ggplot(ddt, aes(x = LENGTH)) + geom_dotplot(aes(fill = Lcut),binwidth = 1/5*sdd)
g <- g + geom_density(aes(y = ..count..))
g <- g + labs(title = "LENGTH data categorized by outlier status")
g

## -----------------------------------------------------------------------------
dir(dirdl)

