## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)




## ----setup--------------------------------------------------------------------
library(Intro2R)

## -----------------------------------------------------------------------------
with(bones, t.test(LWRATIO, mu=8.5, conf.level=0.99))

