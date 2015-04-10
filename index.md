---
title       : acsr package
subtitle    : some examples
author      : Sebastian Daza
job         : PhD Candidate
framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js
hitheme     : solarized_light
widgets     : [mathjax]  # {mathjax, quiz, bootstrap}     
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
    api.key.install(key="")
    ```

- Explore help files of the main functions: 

    ```
    library(acsr)
    ?acsdata
    ?sumacs
    ```
- Check defaults!
 
      - State = WI
      - Year  = 2013
      - Span = 5
      - Level = county

---

## Why to use the `acsdata` function?

- To download the data can be slow, specially when there are many geographic/administrative levels
-  A better approach might be to download the data first, and then use them as input with the `sumacs` function 



    
    ```r
    d <- acsdata(formula = "(b16004_004 + b16004_026 + b16004_048 / b16004_001)",
     level = "county")
    ```
    
    ```
    ## [1] ". . . . . .  ACS variables : 4"
    ## [1] ". . . . . .  Levels : 1"
    ## [1] ". . . . . .  Getting county data"
    ## [1] ". . . . . .  Done!"
    ```

- This will create a list with ACS objects.

---

## Let's now use the `sumacs` function


```r
tab <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048 / b16004_001)", 
varname = "langspan0913", method = "prop", data = d)
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
tab[1:3, c(1:4,11:12), with = FALSE]
```

```
##    stfid sumlevel st_fips cnty_fips langspan0913 langspan0913_moe
## 1: 55001      050      55       001   0.02725587      0.003377554
## 2: 55003      050      55       003   0.01152700      0.003850785
## 3: 55005      050      55       005   0.02040295      0.003084028
```

--- 

## Some options: `format.out`


```r
tab <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048 / b16004_001)", 
varname = "langspan0913", method = "prop", data = d, format.out = "long")
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
tab[1:3, c(1:4,11:13), with = FALSE]
```

```
##    stfid sumlevel st_fips cnty_fips     var_name        est         moe
## 1: 55001      050      55       001 langspan0913 0.02725587 0.003377554
## 2: 55003      050      55       003 langspan0913 0.01152700 0.003850785
## 3: 55005      050      55       005 langspan0913 0.02040295 0.003084028
```

--- 

## Some options: `file`


```r
tab <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048 / b16004_001)", 
varname = "langspan0913", method = "prop", data = d, file = "d.csv")
```

```
## [1] ". . . . . .  ACS variables : 4"
## [1] ". . . . . .  Levels : 1"
## [1] ". . . . . .  New variables : 1"
## [1] ". . . . . .  Creating variables"
## [1] ". . . . . .  Formatting output"
## [1] ". . . . . .  Data exported to a CSV file! Done!"
```

--- 

## Some options: `one.zero`


```r
tab1 <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048) / b16004_001", 
varname = "langspan0913", method = "prop", level = "tract", county = 1, 
tract = 950501, one.zero = FALSE)
```


```
##          stfid tract_fips langspan0913 langspan0913_moe
## 1: 55001950501     950501   0.02263907       0.02518933
```


```r
tab2 <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048) / b16004_001", 
varname = "langspan0913", method = "prop", level = "tract", county = 1, 
tract = 950501, one.zero = TRUE)
```


```
##          stfid tract_fips langspan0913 langspan0913_moe
## 1: 55001950501     950501   0.02263907        0.0245074
```

---

## Some options: `one.zero`

- one.zero = FALSE

    
    ```r
    ( sqrt(( 5.4711125 ^ 2 + 22.4924 ^ 2 + 5.4711125 ^ 2 ) - 
    ( 0.0226390685640362 ^ 2 * 102.1277 ^ 2 )) / 1546 ) * 1.645
    ```
    
    ```
    ## [1] 0.02518932
    ```

- one.zero = TRUE

    
    ```r
    ( sqrt(( 5.4711125 ^ 2 + 22.4924 ^ 2) - 
    ( 0.0226390685640362 ^2 * 102.1277 ^ 2 )) / 1546 ) * 1.645 
    ```
    
    ```
    ## [1] 0.0245074
    ```

---

## Some options: `one.zero` and `ratio`

- method = "ratio" and one.zero = FALSE

    
    ```r
    tab3 <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048) / b16004_001", 
    varname = "langspan0913", method = "ratio", level = "tract", county = 1, 
    tract = 950501, one.zero = FALSE)
    ```

    
    ```
    ##          stfid tract_fips langspan0913 langspan0913_moe
    ## 1: 55001950501     950501   0.02263907       0.02542847
    ```

    
    ```r
    ( sqrt(( 5.4711125 ^ 2 + 22.4924 ^ 2 + 5.4711125 ^ 2 ) 
    + ( 0.0226390685640362 ^ 2 * 102.1277 ^ 2 )) / 1546 ) * 1.645
    ```
    
    ```
    ## [1] 0.02542846
    ```

---

## Some options: `one.zero` and `ratio`

- method = "ratio" and one.zero = TRUE 

    
    ```r
    tab3 <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048) / b16004_001", 
    varname = "langspan0913", method = "ratio", level = "tract", county = 1, 
    tract = 950501, one.zero = TRUE)
    ```

    
    ```
    ##          stfid tract_fips langspan0913 langspan0913_moe
    ## 1: 55001950501     950501   0.02263907       0.02475313
    ```

    
    ```r
    ( sqrt(( 5.4711125 ^ 2 + 22.4924 ^ 2 ) 
    + ( 0.0226390685640362 ^ 2 * 102.1277 ^ 2 )) / 1546 ) * 1.645
    ```
    
    ```
    ## [1] 0.02475312
    ```

---

## Some options: `one.zero` and `agg`

- method = "agg" and one.zero = FALSE 

    
    ```r
    tab4 <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048)", 
    varname = "test", method = "agg", level = "tract", county = 1, 
    tract = 950501, one.zero = FALSE)
    ```

    
    ```
    ##          stfid tract_fips test test_moe
    ## 1: 55001950501     950501   35   39.128
    ```

    
    ```r
    sqrt( 5.4711125 ^2 + 22.4924 ^ 2 + 5.4711125 ^ 2 )  * 1.645
    ```
    
    ```
    ## [1] 39.12798
    ```

---

## Some options: `one.zero` and `agg`

- method = "agg" and one.zero = TRUE 

    
    ```r
    tab4 <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048)", 
    varname = "test", method = "agg", level = "tract", county = 1, 
    tract = 950501, one.zero = TRUE)
    ```

    
    ```
    ##          stfid tract_fips test test_moe
    ## 1: 55001950501     950501   35 38.07887
    ```

    
    ```r
    sqrt( 5.4711125 ^ 2 + 22.4924 ^ 2 )  * 1.645
    ```
    
    ```
    ## [1] 38.07886
    ```

---

## Some details...

- When the square root of the standard error formula doesn't exist (e.g., square root of a negative number), the ratio formula is used  instead.  

- This adjustment is performed unit by unit, row by row.  

- There are some cases where the `one.zero` option makes the square root undefinable. In those cases, the function uses the "ratio" formula to estimate the standard errors. Exists the possibility that the "ratio" estimates are higher than the "proportion" estimates not using the `one.zero` option.  

---

## Using your Excel file

- After adjusting some minor format issues, I save the Excel file as a CSV file
- I read that file in `R`
- I used the corresponding variables to create all indicators

  
  ```r
    sheet <- fread("/Users/sdaza/Documents/UWSociology/00Projects/Various/AppliedPopulationLab/moe.csv")
    dim(sheet)
  ```
  
  ```
  ## [1] 90  5
  ```
  
  ```r
    names(sheet)
  ```
  
  ```
  ## [1] "destination" "myfield"     "type"        "formula"     "moe_varname"
  ```
