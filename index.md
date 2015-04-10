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


```
# set server
options(repos=structure(c(CRAN="http://rweb.quant.ku.edu/cran/")))

# install from cran
install.packages("devtools")
install.packages("acs")

# install from github
devtools::install_github("Rdatatable/data.table", build_vignettes = FALSE)

# install acsr package
devtools::install_github("sdaza/acsr")
```

---

## Load `acsr` and help files


Remember to set the API key for the `acs` package.
You have to do it only once.

```
api.key.install(key="*")
```

Explore help files of the main functions: 
```
library(acsr)
?acsdata
?sumacs
```

----

## Why to use the `acsdata` function?

1. To download the data can be slow, specially when there are many geographic/administrative levels
2. A better approach might be to download the data first, and then use them as input with the `sumacs` function 





```r
d <- acsdata("(b16004_004 + b16004_026 + b16004_048 / b16004_001)", level = "county")
```

```
## [1] ". . . . . .  ACS variables : 4"
## [1] ". . . . . .  Levels : 1"
## [1] ". . . . . .  Getting county data"
## [1] ". . . . . .  Done!"
```

```r
str(d)
```

```
## List of 1
##  $ county:Formal class 'acs' [package "acs"] with 9 slots
##   .. ..@ endyear       : int 2013
##   .. ..@ span          : int 5
##   .. ..@ geography     :'data.frame':	72 obs. of  3 variables:
##   .. .. ..$ NAME  : chr [1:72] "Adams County, Wisconsin" "Ashland County, Wisconsin" "Barron County, Wisconsin" "Bayfield County, Wisconsin" ...
##   .. .. ..$ state : int [1:72] 55 55 55 55 55 55 55 55 55 55 ...
##   .. .. ..$ county: chr [1:72] "001" "003" "005" "007" ...
##   .. ..@ acs.colnames  : chr [1:4] "B16004_004" "B16004_026" "B16004_048" "B16004_001"
##   .. ..@ modified      : logi FALSE
##   .. ..@ acs.units     : Factor w/ 5 levels "count","dollars",..: 1 1 1 1
##   .. ..@ currency.year : int 2013
##   .. ..@ estimate      : num [1:72, 1:4] 47 10 252 37 4328 ...
##   .. .. ..- attr(*, "dimnames")=List of 2
##   .. .. .. ..$ : chr [1:72] "Adams County, Wisconsin" "Ashland County, Wisconsin" "Barron County, Wisconsin" "Bayfield County, Wisconsin" ...
##   .. .. .. ..$ : chr [1:4] "B16004_004" "B16004_026" "B16004_048" "B16004_001"
##   .. ..@ standard.error: num [1:72, 1:4] 26.14 4.26 43.77 11.55 210.33 ...
##   .. .. ..- attr(*, "dimnames")=List of 2
##   .. .. .. ..$ : chr [1:72] "Adams County, Wisconsin" "Ashland County, Wisconsin" "Barron County, Wisconsin" "Bayfield County, Wisconsin" ...
##   .. .. .. ..$ : chr [1:4] "B16004_004" "B16004_026" "B16004_048" "B16004_001"
```
