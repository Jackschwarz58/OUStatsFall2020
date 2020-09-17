## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center",
  message = FALSE,
  warning = FALSE
)

# directory to Lab
dirdl <- system.file("Lab15",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
data(seed)
library(ggplot2)
library(plotly)
head(seed)
g <- ggplot(seed, aes(x = TEMP, y = CHANGE ))
g <- g + geom_point() + stat_smooth(method = "loess", formula = y ~ x)
ggplotly(g)

## ----message=FALSE, warning=FALSE---------------------------------------------
library(ggmcmc)
library(MCMCpack)
which(seed$TEMP==301.0)
seedn <- seed[-5,]

postn <-MCMCregress(formula = CHANGE ~ TEMP,data = seedn, burnin = 1000, mcmc = 10000,thin = 1)

s <- ggs(postn)
ggs_histogram(s)
sm <- summary(postn)
sm

