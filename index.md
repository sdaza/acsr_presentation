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


- Remember to set the API key for the `acs` package. You have to do it only once.

```
api.key.install(key="*")
```

- Explore help files of the main functions: 

```
library(acsr)
?acsdata
?sumacs
```

----

## Why to use the `acsdata` function?

- To download the data can be slow, specially when there are many geographic/administrative levels
-  A better approach might be to download the data first, and then use them as input with the `sumacs` function 



    
    ```r
    d <- acsdata("(b16004_004 + b16004_026 + b16004_048 / b16004_001)", level = "county")
    ```
    
    ```
    ## [1] ". . . . . .  ACS variables : 4"
    ## [1] ". . . . . .  Levels : 1"
    ## [1] ". . . . . .  Getting county data"
    ## [1] ". . . . . .  Done!"
    ```

- This will create a list with ACS objects.

---

## Let's now use the `sumacs`function


```r
tab <- sumacs("(b16004_004 + b16004_026 + b16004_048 / b16004_001)", 
"langspan0913", "prop", data = d)
```

```
## [1] ". . . . . .  ACS variables : 4"
## [1] ". . . . . .  Levels : 1"
## [1] ". . . . . .  New variables : 1"
## [1] ". . . . . .  Creating variables"
## [1] ". . . . . .  Formatting output"
## [1] ". . . . . .  Done!"
```

```r
tab[1:3, c(1:4,10:11), with = FALSE]
```

```
##    stfid sumlevel st_fips cnty_fips sch_dist_ele langspan0913
## 1: 55001      050      55       001           NA   0.02725587
## 2: 55003      050      55       003           NA   0.01152700
## 3: 55005      050      55       005           NA   0.02040295
```

