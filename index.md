---
title       : acsr package
subtitle    : how to use it
author      : Sebastian Daza
framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js
hitheme     : solarized_light
widgets     : [mathjax]  # {mathjax, quiz, bootstrap}     
--- 

## Install `acsr` package in `R`



```r
# set a server
options(repos=structure(c(CRAN="http://rweb.quant.ku.edu/cran/")))

# install devtoos and acs from CRAN
install.packages("devtools")
install.packages("acs")

# install data.table from github
devtools::install_github("Rdatatable/data.table", build_vignettes = FALSE)

# install acsr from github
devtools::install_github("sdaza/acsr")
```

---

## Load `acsr` and help files

- Remember to set the API key for the `acs` package. You have to do it only once

    
    ```r
    api.key.install(key="")
    ```

- Explore help files of the main functions

    
    ```r
    library(acsr)
    ?acsdata
    ?sumacs
    ```

- Check defaults!
    ```
    state = WI
    year  = 2013
    span = 5
    level = county
    ```

---

## Why to use the `acsdata` function?

- To download the data can be slow, especially when there are many geographic or administrative levels
- A better approach is to download the data first, and then use them as input



    
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

- This will create a list of ACS objects

---

## The `sumacs` function


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

- Define a CSV file to export the output

    
    ```r
    tab <- sumacs(formula = "(b16004_004 + b16004_026 + b16004_048 / b16004_001)", 
    varname = "langspan0913", method = "prop", data = d, file = "out.csv")
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

## Some options: standard errors and `one.zero`


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

- `one.zero = FALSE`

    
    ```r
    ( sqrt(( 5.4711125 ^ 2 + 22.4924 ^ 2 + 5.4711125 ^ 2 ) - 
    ( 0.0226390685640362 ^ 2 * 102.1277 ^ 2 )) / 1546 ) * 1.645
    ```
    
    ```
    ## [1] 0.02518932
    ```

- `one.zero = TRUE`

    
    ```r
    ( sqrt(( 5.4711125 ^ 2 + 22.4924 ^ 2) - 
    ( 0.0226390685640362 ^ 2 * 102.1277 ^ 2 )) / 1546 ) * 1.645 
    ```
    
    ```
    ## [1] 0.0245074
    ```

---

## `ratio` and `one.zero` I

- `method = "ratio"` and `one.zero = FALSE`

    
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

## `ratio` and `one.zero` II

- `method = "ratio"` and `one.zero = TRUE` 

    
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

##  `agg` and `one.zero` I

- `method = "agg"` and `one.zero = FALSE` 

    
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
    sqrt( 5.4711125 ^ 2 + 22.4924 ^ 2 + 5.4711125 ^ 2 )  * 1.645
    ```
    
    ```
    ## [1] 39.12798
    ```

---

## `agg` and `one.zero` II

- `method = "agg"` and `one.zero = TRUE` 

    
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

## To note

- When the square root of the standard error formula doesn't exist (e.g., the square root of a negative number), the ratio formula is used  instead.  

- The ratio adjustment is done `case by case`.  

- There are some cases where the `one.zero` option makes the square root undefinable. In those cases, the function uses the "ratio" formula to compute standard errors. 

- There is a possibility that the "ratio" estimates are higher than the "proportion" estimates without the `one.zero` option.  

---

## Using an Excel file

- Save the Excel file as a CSV file after adjusting the format (e.g., no empty rows, name of variables)
- Read that file using `R`



    
    ```r
    sheet <- fread(paste0(path, "moe.csv"))
    str(sheet)
    ```
    
    ```
    ## Classes 'data.table' and 'data.frame':	90 obs. of  5 variables:
    ##  $ destination: chr  "Food_Sec" "Food_Sec" "Food_Sec" "Food_Sec" ...
    ##  $ myfield    : chr  "drive0913" "edass0913" "edcoll0913" "edhs0913" ...
    ##  $ type       : chr  "Prop" "Prop" "Prop" "Prop" ...
    ##  $ formula    : chr  "(b08101_009 + b08101_017) / b08101_001 * 100" "(b15002_014 + b15002_031) / b15002_001 * 100" "(b15002_015 + b15002_032 + b15002_016 + b15002_017 + b15002_018 + b15002_033 + b15002_034 + b15002_035) / b15002_001 * 100" "(b15002_011 + b15002_028) / b15002_001 * 100" ...
    ##  $ moe_varname: chr  "drive0913_moe" "edass0913_moe" "edcoll0913_moe" "edhs0913_moe" ...
    ##  - attr(*, ".internal.selfref")=<externalptr>
    ```

--- 

## Using an Excel file

- Define all levels in a vector

    
    ```r
    # create level vector
    levels <- c("state", "county", "county.subdivision", 
    "tract", "block.group", "congressional.district", 
    "school.district.secondary", "school.district.elementary")
    ```

- This can take a while! Here I downloaded the data first and then I saved them

    
    ```r
    # download the data first
    wi_acs <- acsdata(sheet[, formula], level = levels)
    # save the data
    save(wi_acs, file = "wi_acs.rd")
    ```




--- 

## Using an Excel file


- Define the function fields
- Open the output file in Excel

    
    ```r
    # compute indicators and export the data
    out <- sumacs(formula = sheet[, formula], varname = sheet[, myfield], 
      method = sheet[, type], level = levels, one.zero = TRUE, 
      data = wi_acs, file = "output.csv")
    ```
    
    ```
    ## [1] ". . . . . .  ACS variables : 266"
    ## [1] ". . . . . .  Levels : 8"
    ## [1] ". . . . . .  New variables : 90"
    ## [1] ". . . . . .  Creating variables"
    ## [1] ". . . . . .  Formatting output"
    ## [1] ". . . . . .  Data exported to a CSV file! Done!"
    ```

---

## Conclusions

- `Strengths`
    - Automatized and tailored way to obtain indicators
    - Reads formulas directly
    - Different formats for outputs (wide and long), exports the data
    - Easy way to adjust MOEs to different confidence levels
    - Ratio adjustment of standard errors case by case
    - Zero-option for proportions, ratios and aggregations

- `Limitations`
    - It depends heavily on the ACS package
    - Not the fastest function (loops involved despite some vectorization)
    - It takes less than a minute to create 90 indicators
    - Limited to only eight levels
