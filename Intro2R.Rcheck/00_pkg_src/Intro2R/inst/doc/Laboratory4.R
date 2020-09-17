## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "ws#>",
  fig.align = "center"
)

# directory to Lab
dirdl <- system.file("Lab4",package = "Intro2R")

# create rmd link

library(Intro2R)



## -----------------------------------------------------------------------------
library(ggplot2)
gs <- ggplot(ddt, aes(x=LENGTH,y=WEIGHT)) + geom_point(aes(color = SPECIES)) + geom_smooth(method = "loess")
gs

## -----------------------------------------------------------------------------

g <- ggplot(ddt, aes(x = LENGTH, y = WEIGHT)) +
  geom_point(aes(color = SPECIES)) 
g <- g + geom_smooth(method = "nls", formula = 'y ~ b0*exp(b1*x)', method.args = list(start = list(b0 = 100, b1 = 0.05)),se = FALSE, aes(color = SPECIES))
g <- g + labs(title = "nls fitted to subgroups of SPECIES")
g

## -----------------------------------------------------------------------------
library(ggplot2)
xk = 18
dff <- spruce
df <- within(dff, X<-(BHDiameter-xk)*(BHDiameter>xk))
head(df)
ylm <- lm(Height ~ BHDiameter + X, data = df)
summary(ylm)
gg <- ggplot(df, aes(x = BHDiameter, y= Height)) + geom_point() + 
  geom_smooth(method = "lm", formula = 'y ~ x + I((x-xk)*(x>xk))', se = FALSE, data = df)
gg

## ----fig.align='center'-------------------------------------------------------
spruce.df = spruce
head(spruce.df)
myf2 = function(x,xk,xk2,coef){
  coef[1]+coef[2]*(x) + coef[3]*(x-xk)*(x-xk>0)+ coef[4]*(x-xk2)*(x-xk2>0)
}

coeff = function(xk,xk2){ # data=spruce.df
  df=within(spruce.df, 
            {
            X<-(BHDiameter-xk)*(BHDiameter>xk) 
            X2<-(BHDiameter-xk2)*(BHDiameter>xk2)
            }
            ) 
  lmp=lm(Height ~ BHDiameter + X + X2, data=df)
  coef(lmp)
}


with(spruce.df,plot(BHDiameter, Height,
                    pch = 21, 
                    cex=1.5,
                    bg="green",
                    main="Height Vs BHDiameter using piecewise regression"
                    ))

cf = coeff(10,18)
curve(myf2(x,10,18,cf), add=TRUE, lwd=2,col="Blue")



## -----------------------------------------------------------------------------
# combinations of xk1<=xk2
n=4
x=seq(5,20, length=n)
for(xk1 in x[x<=(max(x)-3)]){
  for(xk2 in x[x>=xk1]){
    print(paste0("xk1=", xk1,", ", "xk2=",xk2))
  }
  }


## -----------------------------------------------------------------------------

Eat <-with(ddt, cut(DDT, breaks = c(0,5, max(DDT)+1), labels = c("OK", "Dang"), right = FALSE, ordered_result = TRUE))

summary(Eat)
class(Eat)

ddt <- within(ddt, Eat <- Eat)
head(ddt)
levels(Eat)


## -----------------------------------------------------------------------------
yglm <- glm(Eat ~ LENGTH + WEIGHT,family = binomial(link = "logit") ,data = ddt)
summary(yglm)
cf<-coef(yglm)



## -----------------------------------------------------------------------------
prob <-predict(yglm, type = "response")
head(prob,10) 

