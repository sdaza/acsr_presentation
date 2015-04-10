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


-Remember to set the API key for the `acs` package. You have to do it only once.

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
tab
```

```
##     stfid sumlevel st_fips cnty_fips cnty_sub_fips tract_fips block_group
##  1: 55001      050      55       001            NA         NA          NA
##  2: 55003      050      55       003            NA         NA          NA
##  3: 55005      050      55       005            NA         NA          NA
##  4: 55007      050      55       007            NA         NA          NA
##  5: 55009      050      55       009            NA         NA          NA
##  6: 55011      050      55       011            NA         NA          NA
##  7: 55013      050      55       013            NA         NA          NA
##  8: 55015      050      55       015            NA         NA          NA
##  9: 55017      050      55       017            NA         NA          NA
## 10: 55019      050      55       019            NA         NA          NA
## 11: 55021      050      55       021            NA         NA          NA
## 12: 55023      050      55       023            NA         NA          NA
## 13: 55025      050      55       025            NA         NA          NA
## 14: 55027      050      55       027            NA         NA          NA
## 15: 55029      050      55       029            NA         NA          NA
## 16: 55031      050      55       031            NA         NA          NA
## 17: 55033      050      55       033            NA         NA          NA
## 18: 55035      050      55       035            NA         NA          NA
## 19: 55037      050      55       037            NA         NA          NA
## 20: 55039      050      55       039            NA         NA          NA
## 21: 55041      050      55       041            NA         NA          NA
## 22: 55043      050      55       043            NA         NA          NA
## 23: 55045      050      55       045            NA         NA          NA
## 24: 55047      050      55       047            NA         NA          NA
## 25: 55049      050      55       049            NA         NA          NA
## 26: 55051      050      55       051            NA         NA          NA
## 27: 55053      050      55       053            NA         NA          NA
## 28: 55055      050      55       055            NA         NA          NA
## 29: 55057      050      55       057            NA         NA          NA
## 30: 55059      050      55       059            NA         NA          NA
## 31: 55061      050      55       061            NA         NA          NA
## 32: 55063      050      55       063            NA         NA          NA
## 33: 55065      050      55       065            NA         NA          NA
## 34: 55067      050      55       067            NA         NA          NA
## 35: 55069      050      55       069            NA         NA          NA
## 36: 55071      050      55       071            NA         NA          NA
## 37: 55073      050      55       073            NA         NA          NA
## 38: 55075      050      55       075            NA         NA          NA
## 39: 55077      050      55       077            NA         NA          NA
## 40: 55078      050      55       078            NA         NA          NA
## 41: 55079      050      55       079            NA         NA          NA
## 42: 55081      050      55       081            NA         NA          NA
## 43: 55083      050      55       083            NA         NA          NA
## 44: 55085      050      55       085            NA         NA          NA
## 45: 55087      050      55       087            NA         NA          NA
## 46: 55089      050      55       089            NA         NA          NA
## 47: 55091      050      55       091            NA         NA          NA
## 48: 55093      050      55       093            NA         NA          NA
## 49: 55095      050      55       095            NA         NA          NA
## 50: 55097      050      55       097            NA         NA          NA
## 51: 55099      050      55       099            NA         NA          NA
## 52: 55101      050      55       101            NA         NA          NA
## 53: 55103      050      55       103            NA         NA          NA
## 54: 55105      050      55       105            NA         NA          NA
## 55: 55107      050      55       107            NA         NA          NA
## 56: 55109      050      55       109            NA         NA          NA
## 57: 55111      050      55       111            NA         NA          NA
## 58: 55113      050      55       113            NA         NA          NA
## 59: 55115      050      55       115            NA         NA          NA
## 60: 55117      050      55       117            NA         NA          NA
## 61: 55119      050      55       119            NA         NA          NA
## 62: 55121      050      55       121            NA         NA          NA
## 63: 55123      050      55       123            NA         NA          NA
## 64: 55125      050      55       125            NA         NA          NA
## 65: 55127      050      55       127            NA         NA          NA
## 66: 55129      050      55       129            NA         NA          NA
## 67: 55131      050      55       131            NA         NA          NA
## 68: 55133      050      55       133            NA         NA          NA
## 69: 55135      050      55       135            NA         NA          NA
## 70: 55137      050      55       137            NA         NA          NA
## 71: 55139      050      55       139            NA         NA          NA
## 72: 55141      050      55       141            NA         NA          NA
##     stfid sumlevel st_fips cnty_fips cnty_sub_fips tract_fips block_group
##     cong_dist sch_dist_sec sch_dist_ele langspan0913 langspan0913_moe
##  1:        NA           NA           NA  0.027255875      0.003377554
##  2:        NA           NA           NA  0.011526996      0.003850785
##  3:        NA           NA           NA  0.020402953      0.003084028
##  4:        NA           NA           NA  0.009367194      0.002414586
##  5:        NA           NA           NA  0.059366698      0.002225393
##  6:        NA           NA           NA  0.016474465      0.002839371
##  7:        NA           NA           NA  0.009723922      0.002971791
##  8:        NA           NA           NA  0.035401690      0.003839479
##  9:        NA           NA           NA  0.009694867      0.002245174
## 10:        NA           NA           NA  0.033190578      0.002012461
## 11:        NA           NA           NA  0.021494697      0.003154417
## 12:        NA           NA           NA  0.010707457      0.003349987
## 13:        NA           NA           NA  0.050841062      0.001876963
## 14:        NA           NA           NA  0.028600406      0.002950087
## 15:        NA           NA           NA  0.022787851      0.003622841
## 16:        NA           NA           NA  0.011575470      0.003228735
## 17:        NA           NA           NA  0.013870160      0.002911648
## 18:        NA           NA           NA  0.013413467      0.002792815
## 19:        NA           NA           NA  0.014844486      0.008197735
## 20:        NA           NA           NA  0.036631298      0.003435421
## 21:        NA           NA           NA  0.010481941      0.003602863
## 22:        NA           NA           NA  0.008812491      0.001867191
## 23:        NA           NA           NA  0.022392797      0.003139100
## 24:        NA           NA           NA  0.040344062      0.008211006
## 25:        NA           NA           NA  0.016744900      0.004207343
## 26:        NA           NA           NA  0.008906741      0.003704700
## 27:        NA           NA           NA  0.013557737      0.003108917
## 28:        NA           NA           NA  0.051495900      0.003685245
## 29:        NA           NA           NA  0.016474792      0.003317605
## 30:        NA           NA           NA  0.078379797      0.004878007
## 31:        NA           NA           NA  0.023640662      0.003810021
## 32:        NA           NA           NA  0.014037218      0.002246981
## 33:        NA           NA           NA  0.031676506      0.004378172
## 34:        NA           NA           NA  0.015046789      0.005999367
## 35:        NA           NA           NA  0.007548276      0.002140010
## 36:        NA           NA           NA  0.026946693      0.002895885
## 37:        NA           NA           NA  0.020440102      0.002051648
## 38:        NA           NA           NA  0.015614752      0.004009565
## 39:        NA           NA           NA  0.019590322      0.004046101
## 40:        NA           NA           NA  0.004093118      0.004525601
## 41:        NA           NA           NA  0.099881414      0.001592518
## 42:        NA           NA           NA  0.033360495      0.003906322
## 43:        NA           NA           NA  0.012924117      0.002173892
## 44:        NA           NA           NA  0.009974552      0.002839174
## 45:        NA           NA           NA  0.035298077      0.002533859
## 46:        NA           NA           NA  0.017866475      0.002778188
## 47:        NA           NA           NA  0.016050444      0.005692699
## 48:        NA           NA           NA  0.012755367      0.002706789
## 49:        NA           NA           NA  0.015271972      0.002215743
## 50:        NA           NA           NA  0.021522555      0.002418142
## 51:        NA           NA           NA  0.009460667      0.003804983
## 52:        NA           NA           NA  0.065051433      0.003842398
## 53:        NA           NA           NA  0.022115499      0.006779258
## 54:        NA           NA           NA  0.064181588      0.002686358
## 55:        NA           NA           NA  0.012112860      0.004509828
## 56:        NA           NA           NA  0.018607359      0.002735101
## 57:        NA           NA           NA  0.033070866      0.003593951
## 58:        NA           NA           NA  0.008025682      0.002775664
## 59:        NA           NA           NA  0.018443454      0.002634895
## 60:        NA           NA           NA  0.041051388      0.003050268
## 61:        NA           NA           NA  0.012461220      0.002781529
## 62:        NA           NA           NA  0.046461074      0.003455584
## 63:        NA           NA           NA  0.016131345      0.003209659
## 64:        NA           NA           NA  0.011292285      0.002637368
## 65:        NA           NA           NA  0.083608998      0.004704415
## 66:        NA           NA           NA  0.010246174      0.002532620
## 67:        NA           NA           NA  0.021982170      0.002402085
## 68:        NA           NA           NA  0.028780398      0.001953388
## 69:        NA           NA           NA  0.021958469      0.003771548
## 70:        NA           NA           NA  0.048950148      0.005306473
## 71:        NA           NA           NA  0.025226661      0.002552703
## 72:        NA           NA           NA  0.019142922      0.002800865
##     cong_dist sch_dist_sec sch_dist_ele langspan0913 langspan0913_moe
```

