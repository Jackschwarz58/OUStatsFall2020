## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center",
  message = FALSE,
  warning = FALSE
)

# directory to Lab
dirdl <- system.file("Lab16",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
data("liquid")
head(liquid)

## -----------------------------------------------------------------------------
library(ggplot2)
g <- ggplot(liquid, aes(x = TIME, y = MASS)) + geom_point()
g1 <- g + geom_smooth(method = "loess", formula = y~x)
g1

## -----------------------------------------------------------------------------
ylm1 <- lm(MASS ~ TIME, data = liquid)
ylm2 <- lm(MASS ~ TIME + I(TIME^2), data = liquid)
ylm3 <- lm(log(MASS+1) ~ TIME + I(TIME^2), data=liquid)
s1 <- summary(ylm1)
s2 <- summary(ylm2)
s3 <- summary(ylm3)
Rasq <- list(Rasq1 = s1$adj.r.squared,
               Rasq2 = s2$adj.r.squared,
               Rasq3 = s3$adj.r.squared)
Rasq


## -----------------------------------------------------------------------------
sm <- summary(ylm2)
cf = coef(ylm2)
cf

## -----------------------------------------------------------------------------
g2 <- g + geom_smooth(method = "lm", formula = y~x+I(x^2))
g2 <- g2 + ggtitle("A quadratic model")
g2

## -----------------------------------------------------------------------------
summary(liquid)
nls1 <- nls(formula = MASS ~ b0*exp(b1*TIME + b2*TIME^2 ),
            data = liquid,
            start = list(b0 = 7, b1 = -0.05,b2  = - 0.0005 ),
            trace = TRUE
            )
summary(nls1)

## ----message=TRUE, warning=TRUE-----------------------------------------------
cf <- coef(nls1)

mynlsfun <- function(x) cf[1]*exp(cf[2]*x + cf[3]*x^2)

plot(MASS ~ TIME, data = liquid, main = "Non linear Least Squares")


curve(mynlsfun, lwd = 3, col = "Blue", add = TRUE)
text(30,4, expression(hat(E)(MASS)==hat(beta)[0]*exp(hat(beta)[1]*TIME + hat(beta)[2]*TIME^2)))




