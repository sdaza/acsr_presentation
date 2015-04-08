---
title       : acsr examples
subtitle    : 
author      : Sebastian Daza
job         : PhD Student
framework   : html5slides      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Install `acsr` package in `R`

First, Install some dependencies: 

```
# set server
options(repos=structure(c(CRAN="http://rweb.quant.ku.edu/cran/")))

# install from cran
install.packages("devtools")
install.packages("acs")

# install from github
devtools::install_github("Rdatatable/data.table", build_vignettes = FALSE)
devtools::install_github("sdaza/acsr")
```


## Load `acsr` and help files

```
library(acsr)

?acsdata
?sumacs
```
