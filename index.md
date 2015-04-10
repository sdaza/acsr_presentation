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

```
library(acsr)
```

Remember to set the API key for the `acs` package.
You have to do it only once.

```
api.key.install(key="*")
```

Explore help files of the main functions: 
```
?acsdata
?sumacs
```

----

## Why to use the `acsdata` function?

1. To download the data can be slow, specially when there are many geographic/administrative levels
2. A better approach might be to download the data first, and then use them as input with the `sumacs` function 
3. Main arguments of the `acsdata` function are...

```
acsdata(formula, level = "county", endyear = 2013, span = 5,
  state = "WI", county = "*", county_subdivision = "*", tract = "*",
  block_group = "*", congressional_district = "*",
  school_district_secondary = "*", school_district_elementary = "*")
```
