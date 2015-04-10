---
title       : acsr package
subtitle    : some examples
author      : Sebastian Daza
job         : Ph.D. Student
framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js
hitheme     : solarized_light
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

---

## Load `acsr` and help files

```
library(acsr)
```

Remember to set the API key for the `acs` package.
You have to do it just once.

```
api.key.install(key="*")
```

Explore help files of the main functions: 
```
?acsdata
?sumacs
```

----

## Why `acsdata`?

1. To download the data can be slow, specially when there are many geographic levels
2. Better, to download the data first, then use them as input 
3. Main arguments of the `acsdata` function
