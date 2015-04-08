---
title       : `acsr` examples
subtitle    : 
author      : Sebastian Daza
job         : PhD Student
widgets     : []            # {mathjax, quiz, bootstrap}
---


## Install `acsr` package in `R`

First, install some dependencies:  

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



----

## Load `acsr` and help files

```
library(acsr)
```

Remember to set the API key for the `acs` package.  
You have to do it just once.

```
api.key.install(key="*")
```

Explore help files for the two main functions: 
```
?acsdata
?sumacs
```
