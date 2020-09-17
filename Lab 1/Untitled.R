library(ggplot2)

getwd()



ddt <- read.csv("DDT.csv")
head(ddt)


ggplot(ddt, aes(x=WEIGHT)) + geom_histogram() + ggtitle("Jack Schwarz")


