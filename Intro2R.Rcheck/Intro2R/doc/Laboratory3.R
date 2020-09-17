## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab3",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
pairs(~ LENGTH + WEIGHT + DDT,data=ddt)

## ----eval=FALSE---------------------------------------------------------------
#  plot()
#  curve()
#  abline()
#  segments()
#  polygon()

## -----------------------------------------------------------------------------
with(ddt, plot(LENGTH,WEIGHT))

## -----------------------------------------------------------------------------
with(ddt,
     plot(x=LENGTH,
          y=WEIGHT,
          pch = 21, # open circle
          bg = "Blue", #bg color
          main = "Plot using Base R" # Title
          )
     ) 

## -----------------------------------------------------------------------------
with(ddt, 
     {plot(LENGTH,WEIGHT, main = "Add a plot with curve()")
      ylm <- lm(log(WEIGHT)~LENGTH)
      f<-function(x){
        cf<-coef(ylm)
        exp(cf[1]+cf[2]*x)
      }
      curve(f(x),add=TRUE, lwd=2, col = "purple")
     }
)

## -----------------------------------------------------------------------------
library(ggplot2)
g <- ggplot(ddt,aes(x = LENGTH, y = WEIGHT)) + geom_point()
g

## -----------------------------------------------------------------------------
g2 <- ggplot(ddt, aes(x=LENGTH, y=WEIGHT)) + geom_point()+ geom_smooth(method = lm,formula=y~x + I(x^2), se = FALSE)
g2


## -----------------------------------------------------------------------------
g3 <- ggplot(ddt, aes(x=LENGTH, y=WEIGHT)) + geom_point(aes(color = SPECIES))+ geom_smooth(method = lm,formula=y~x + I(x^2), se = FALSE, color = "Gray")
g3 <- g3 + labs(title = "Quadratic with  species distribution")
g3



## -----------------------------------------------------------------------------
plot(WEIGHT~LENGTH, data = ddt)

## -----------------------------------------------------------------------------
ylm <- with(ddt,  lm(WEIGHT ~ LENGTH))
coef(ylm)

## -----------------------------------------------------------------------------
res <- residuals(ylm)
head(res)

## -----------------------------------------------------------------------------
methods(class="lm")

## -----------------------------------------------------------------------------
plot(ylm, which = 1)

## -----------------------------------------------------------------------------
ylm2 <- with(ddt, lm(WEIGHT ~ LENGTH + I(LENGTH^2)))
coef(ylm2)

## -----------------------------------------------------------------------------
summary(ylm)$adj.r.squared
summary(ylm2)$adj.r.squared

## -----------------------------------------------------------------------------
anova(ylm,ylm2)

## -----------------------------------------------------------------------------
library(s20x)
ciReg(ylm2)

## -----------------------------------------------------------------------------
plot(ylm2, which = 1)

## -----------------------------------------------------------------------------
m <- ggplot(ddt, aes(x = LENGTH, y = WEIGHT)) + geom_point()
m <- m + geom_smooth(color = "Green", method = "lm",formula = (y~x + I(x^2))) 
m <- m + geom_smooth(color = "Red", method = "lm", formula = (y ~ x)) + labs(title = "Two models, green \"best\" ")
m

## ----eval=TRUE----------------------------------------------------------------
ylm3 <- nls(WEIGHT ~ b0*exp(b1*LENGTH),data = ddt, start = list(b0 = 100, b1=0.05), algorithm = "port")
coef(ylm3)


## -----------------------------------------------------------------------------
methods(class = "nls")

## -----------------------------------------------------------------------------
ylm4 <- lm(log(WEIGHT)~LENGTH, data = ddt)
cf<-coef(ylm4)
list(exp(cf[1]), cf[2])

## -----------------------------------------------------------------------------
gnls <- ggplot(ddt, aes(x = LENGTH, y = WEIGHT)) + geom_point()
gnls <- gnls + geom_smooth(method = "nls",  formula = 'y ~ b0*exp(b1*x)', 
                           method.args = list(start = list(b0 =100,b1=0.05)),
                           se = FALSE, col = "purple")
gnls <- gnls + labs(title = "Non linear model using \"nls\": purple and linear model using \"lm\": green")

gnls <- gnls + geom_smooth(color = "Green", method = "lm",formula = (y~x + I(x^2))) 
gnls


## -----------------------------------------------------------------------------
summary(ylm)

## -----------------------------------------------------------------------------

predict(ylm, data.frame(LENGTH=30:39))


## -----------------------------------------------------------------------------

predict(ylm2, data.frame( LENGTH = 30:39))

## -----------------------------------------------------------------------------
predict(ylm3, data.frame(LENGTH = 30:39))

