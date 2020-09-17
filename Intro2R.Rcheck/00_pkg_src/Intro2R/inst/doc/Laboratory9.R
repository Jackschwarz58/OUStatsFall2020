## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab9",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
data(ddt)
library(ggplot2)
g <- ggplot(ddt, aes(x = SPECIES, y = LENGTH, fill = SPECIES)) + geom_boxplot()
g

## -----------------------------------------------------------------------------
library(boot)
myfun <- function(data,indices){
  d<-data[indices,]
  dbarcat <- mean(with(d, d[SPECIES == "CCATFISH","LENGTH"]))
  dbarbas <- mean(with(d, d[SPECIES == "LMBASS", "LENGTH"]))
  dbarbuf <- mean(with(d, d[SPECIES == "SMBUFFALO", "LENGTH"]))
  return(c(dbarcat = dbarcat, dbarbas = dbarbas, dbarbuf = dbarbuf))
}




## -----------------------------------------------------------------------------
out <-boot(ddt,myfun, R = 10000)

## -----------------------------------------------------------------------------
outci <- boot.ci(out, conf = 0.95, index = 1,type = "perc")
outci

## -----------------------------------------------------------------------------
names(out)

## -----------------------------------------------------------------------------
names(outci)

## -----------------------------------------------------------------------------
methods(class = "boot")
plot(out, index = 1) # this will call plot.boot


## -----------------------------------------------------------------------------
ci = outci$percent[1,c(4,5)]
ci

## -----------------------------------------------------------------------------
hist(out$t[,1], 
     main = "CCATFISH", 
     col = "green", 
     prob = TRUE,
     xlab = "sample mean")

lines(density(out$t[,1]), 
      lwd = 2,
      col = "red")

abline(v = ci, 
       col = "Blue", 
       lwd = 3)

