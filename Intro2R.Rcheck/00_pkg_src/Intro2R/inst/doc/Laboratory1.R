## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE,
  fig.align = "center"
)

dirdl <- system.file("Lab1",package = "Intro2R")
 


## ----setup--------------------------------------------------------------------
library(Intro2R)


## ---- eval=FALSE--------------------------------------------------------------
#  ---
#  title: 'Lab 1'
#  author: "Possible Student"
#  date: '`r format(Sys.Date(),format="%A, %B %d, %Y")`'
#  output:
#    html_document:
#      fig_caption: true
#      highlights: pygments
#      number_sections: no
#      theme: spacelab
#      toc: yes
#      toc_float: yes
#  ---

## ----eval = FALSE-------------------------------------------------------------
#  
#  knitr::opts_chunk$set(echo = TRUE)
#  
#  

## ----echo=FALSE---------------------------------------------------------------
dir(dirdl)

## -----------------------------------------------------------------------------
dim(ddt)
dim(flights)

## -----------------------------------------------------------------------------
ddt$DDT
ddt$DDT > 8
ddt[ddt$DDT > 8,]

## -----------------------------------------------------------------------------
ddtg8<-ddt[ddt$DDT > 8,]
summary(ddtg8)

## -----------------------------------------------------------------------------
#ddtl8$SPECIES
summary(ddtg8$SPECIES)

## -----------------------------------------------------------------------------
`%mypipe%` = function(x,y) x*y - y^x
2 %mypipe% 3

## -----------------------------------------------------------------------------
data(ddt)
library(dplyr)
library(ggplot2)
df <- ddt %>% filter(RIVER == "TRM" & SPECIES == "CCATFISH")

g <- ggplot(df, aes(x = LENGTH, y = WEIGHT)) + geom_point() + ggtitle("Catfish caught on TRM")
g

## -----------------------------------------------------------------------------
by_sp <- ddt %>% group_by(SPECIES) 
by_sp %>% summarise(DDT = mean(DDT))

## -----------------------------------------------------------------------------
df <- ddt %>% select(LENGTH,WEIGHT) 
head(df)

## -----------------------------------------------------------------------------
Adf <- ddt %>% mutate(A = LENGTH*WEIGHT)
head(Adf)

## -----------------------------------------------------------------------------
df <- ddt %>% arrange( DDT)
tail(df)

## -----------------------------------------------------------------------------
df <- ddt %>% arrange(desc(DDT))
tail(df)

## -----------------------------------------------------------------------------
data(lichen)
lichen


## -----------------------------------------------------------------------------
lichen %>% group_by(LOCATION)%>% summarise(MeanLevel = mean(LOGCES), MedianLevel = median(LOGCES), ModeLevel = mymode(LOGCES) )

