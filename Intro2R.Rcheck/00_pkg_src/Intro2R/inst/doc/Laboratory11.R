## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab11",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------

y1 <- rnorm(30,mean=35, sd =10)
y2 <- rnorm(40, mean=25, sd =10)

alpha <- 0.05

s1sq <- var(y1)
s2sq <- var(y2)
n1 <- length(y1)
n2 <- length(y2)

spsq <- ((n1-1)*s1sq + (n2-1)*s2sq)/(n1+n2-2)

mp <- c(-1,1) # make a vector to subtract and then add 

t <- qt(1-alpha/2, n1+n2-2)

ci <- mean(y1)-mean(y2)+ mp*t*sqrt(spsq)*(1/n1 + 1/n2)^(1/2)
ci

## -----------------------------------------------------------------------------
t.test(y1,y2, var.equal = TRUE, conf.level = 0.95)$conf.int

## -----------------------------------------------------------------------------

nu = ((s1sq)/n1 +s2sq/n2)^2/((s1sq/n1)^2/(n1-1)+(s2sq/n2)^2/(n2-1))

tnu <- qt(1-alpha/2, nu)
ci <- mean(y1)-mean(y2) + mp*tnu*(s1sq/n1 + s2sq/n2)^(1/2)
ci

## -----------------------------------------------------------------------------
t.test(y1,y2, var.equal = FALSE, conf.level = 0.95)$conf.int

## -----------------------------------------------------------------------------
ylm <- lm(LENGTH ~ WEIGHT, data = ddt)
stats::confint(ylm, c("(Intercept)", "WEIGHT"), level=0.95)

## -----------------------------------------------------------------------------
predict(ylm, data.frame(WEIGHT = c(1005,1020)), interval = "confidence")

## -----------------------------------------------------------------------------
predict(ylm, data.frame(WEIGHT = c(1005,1020)), interval = "prediction")

## -----------------------------------------------------------------------------
ylm2 <- lm(LENGTH ~ WEIGHT + I(WEIGHT^2), data = ddt)
# a. combine predictions 
pred <- predict(ylm2, interval = "prediction")
dmore <- cbind(ddt, pred)#column bind
head(dmore)
# b. Quadratic curve with points added
library("ggplot2")
p <- ggplot(dmore, aes(x= WEIGHT, y = LENGTH)) +
  geom_point() +
  stat_smooth(method = lm, formula = y~x+I(x^2))
# c. lower and upper lines added
p <- p + geom_line(aes(y = lwr), color = "orange", linetype = "dashed")+
    geom_line(aes(y = upr), color = "orange", linetype = "dashed")
p + ggtitle("Quadratic curve with prediction intervals")

