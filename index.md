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

```
acsdata(formula, level = "county", endyear = 2013, span = 5,
  state = "WI", county = "*", county_subdivision = "*", tract = "*",
  block_group = "*", congressional_district = "*",
  school_district_secondary = "*", school_district_elementary = "*")
```


```r
library(acsr)
acsdata("(b16004_004 + b16004_026 + b16004_048 / b16004_001)", level = "county")
```

```
## [1] ". . . . . .  ACS variables : 4"
## [1] ". . . . . .  Levels : 1"
## [1] ". . . . . .  Getting county data"
## [1] ". . . . . .  Done!"
```

```
## $county
## ACS DATA: 
##  2009 -- 2013 ;
##   Estimates w/90% confidence intervals;
##   for different intervals, see confint()
##                               B16004_004    B16004_026     B16004_048  
## Adams County, Wisconsin       47 +/- 43     456 +/- 50     41 +/- 14   
## Ashland County, Wisconsin     10 +/- 7      140 +/- 51     24 +/- 27   
## Barron County, Wisconsin      252 +/- 72    585 +/- 107    42 +/- 32   
## Bayfield County, Wisconsin    37 +/- 19     80 +/- 27      18 +/- 11   
## Brown County, Wisconsin       4328 +/- 346  9209 +/- 380   318 +/- 75  
## Buffalo County, Wisconsin     53 +/- 25     154 +/- 26     3 +/- 3     
## Burnett County, Wisconsin     59 +/- 31     72 +/- 30      12 +/- 7    
## Calumet County, Wisconsin     551 +/- 129   1035 +/- 113   44 +/- 43   
## Chippewa County, Wisconsin    112 +/- 59    447 +/- 117    11 +/- 16   
## Clark County, Wisconsin       329 +/- 48    707 +/- 41     18 +/- 10   
## Columbia County, Wisconsin    309 +/- 97    743 +/- 131    95 +/- 42   
## Crawford County, Wisconsin    68 +/- 43     65 +/- 25      35 +/- 17   
## Dane County, Wisconsin        6594 +/- 526  16535 +/- 690  585 +/- 117 
## Dodge County, Wisconsin       555 +/- 151   1774 +/- 193   68 +/- 33   
## Door County, Wisconsin        207 +/- 36    354 +/- 84     46 +/- 31   
## Douglas County, Wisconsin     150 +/- 90    324 +/- 99     6 +/- 5     
## Dunn County, Wisconsin        70 +/- 35     506 +/- 114    0 +/- 20    
## Eau Claire County, Wisconsin  261 +/- 107   961 +/- 238    39 +/- 29   
## Florence County, Wisconsin    10 +/- 13     53 +/- 31      0 +/- 9     
## Fond du Lac County, Wisconsin 981 +/- 246   2375 +/- 209   155 +/- 65  
## Forest County, Wisconsin      7 +/- 6       74 +/- 30      11 +/- 8    
## Grant County, Wisconsin       87 +/- 35     318 +/- 80     20 +/- 22   
## Green County, Wisconsin       211 +/- 63    539 +/- 88     26 +/- 11   
## Green Lake County, Wisconsin  220 +/- 102   472 +/- 104    35 +/- 26   
## Iowa County, Wisconsin        119 +/- 59    249 +/- 72     3 +/- 5     
## Iron County, Wisconsin        14 +/- 12     31 +/- 15      6 +/- 9     
## Jackson County, Wisconsin     54 +/- 22     207 +/- 53     0 +/- 17    
## Jefferson County, Wisconsin   1159 +/- 164  2855 +/- 236   55 +/- 47   
## Juneau County, Wisconsin      85 +/- 35     300 +/- 72     30 +/- 24   
## Kenosha County, Wisconsin     3251 +/- 527  8440 +/- 545   556 +/- 79  
## Kewaunee County, Wisconsin    170 +/- 60    282 +/- 43     8 +/- 7     
## La Crosse County, Wisconsin   386 +/- 164   1081 +/- 178   59 +/- 33   
## Lafayette County, Wisconsin   157 +/- 58    326 +/- 35     16 +/- 13   
## Langlade County, Wisconsin    110 +/- 90    171 +/- 68     2 +/- 3     
## Lincoln County, Wisconsin     50 +/- 27     143 +/- 51     13 +/- 9    
## Manitowoc County, Wisconsin   679 +/- 151   1300 +/- 153   88 +/- 56   
## Marathon County, Wisconsin    721 +/- 175   1762 +/- 185   90 +/- 43   
## Marinette County, Wisconsin   187 +/- 92    360 +/- 120    72 +/- 49   
## Marquette County, Wisconsin   77 +/- 34     191 +/- 47     17 +/- 10   
## Menominee County, Wisconsin   3 +/- 6       13 +/- 14      0 +/- 9     
## Milwaukee County, Wisconsin   22368 +/- 882 61552 +/- 1063 4097 +/- 248
## Monroe County, Wisconsin      314 +/- 89    1023 +/- 132   55 +/- 35   
## Oconto County, Wisconsin      110 +/- 49    322 +/- 58     27 +/- 14   
## Oneida County, Wisconsin      77 +/- 47     239 +/- 83     25 +/- 18   
## Outagamie County, Wisconsin   1740 +/- 267  3874 +/- 315   259 +/- 85  
## Ozaukee County, Wisconsin     290 +/- 101   1137 +/- 203   43 +/- 29   
## Pepin County, Wisconsin       45 +/- 25     67 +/- 28      0 +/- 13    
## Pierce County, Wisconsin      123 +/- 56    349 +/- 87     20 +/- 14   
## Polk County, Wisconsin        227 +/- 58    346 +/- 60     59 +/- 38   
## Portage County, Wisconsin     301 +/- 89    1101 +/- 132   26 +/- 20   
## Price County, Wisconsin       18 +/- 12     91 +/- 47      18 +/- 16   
## Racine County, Wisconsin      3106 +/- 441  8002 +/- 536   762 +/- 99  
## Richland County, Wisconsin    151 +/- 104   214 +/- 47     8 +/- 7     
## Rock County, Wisconsin        3089 +/- 254  6400 +/- 305   153 +/- 73  
## Rusk County, Wisconsin        43 +/- 21     108 +/- 56     16 +/- 17   
## St. Croix County, Wisconsin   281 +/- 88    1169 +/- 196   20 +/- 23   
## Sauk County, Wisconsin        522 +/- 137   1379 +/- 158   31 +/- 19   
## Sawyer County, Wisconsin      20 +/- 20     91 +/- 37      14 +/- 10   
## Shawano County, Wisconsin     218 +/- 58    469 +/- 82     41 +/- 27   
## Sheboygan County, Wisconsin   1237 +/- 199  3004 +/- 256   207 +/- 64  
## Taylor County, Wisconsin      53 +/- 26     186 +/- 47     2 +/- 3     
## Trempealeau County, Wisconsin 320 +/- 72    939 +/- 60     2 +/- 4     
## Vernon County, Wisconsin      194 +/- 68    239 +/- 57     17 +/- 12   
## Vilas County, Wisconsin       69 +/- 34     115 +/- 36     48 +/- 22   
## Walworth County, Wisconsin    2247 +/- 302  5626 +/- 333   215 +/- 71  
## Washburn County, Wisconsin    33 +/- 19     106 +/- 32     15 +/- 8    
## Washington County, Wisconsin  864 +/- 183   1774 +/- 231   99 +/- 51   
## Waukesha County, Wisconsin    2780 +/- 374  7255 +/- 603   621 +/- 140 
## Waupaca County, Wisconsin     320 +/- 95    754 +/- 160    12 +/- 13   
## Waushara County, Wisconsin    359 +/- 80    746 +/- 93     35 +/- 15   
## Winnebago County, Wisconsin   1147 +/- 264  2760 +/- 302   83 +/- 46   
## Wood County, Wisconsin        562 +/- 130   747 +/- 145    32 +/- 24   
##                               B16004_001   
## Adams County, Wisconsin       19959 +/- 27 
## Ashland County, Wisconsin     15095 +/- 37 
## Barron County, Wisconsin      43082 +/- 93 
## Bayfield County, Wisconsin    14412 +/- 18 
## Brown County, Wisconsin       233380 +/- 33
## Buffalo County, Wisconsin     12747 +/- 11 
## Burnett County, Wisconsin     14706 +/- 19 
## Calumet County, Wisconsin     46043 +/- 77 
## Chippewa County, Wisconsin    58794 +/- 116
## Clark County, Wisconsin       31756 +/- 27 
## Columbia County, Wisconsin    53362 +/- 28 
## Crawford County, Wisconsin    15690 +/- 52 
## Dane County, Wisconsin        466434 +/- 18
## Dodge County, Wisconsin       83810 +/- 99 
## Door County, Wisconsin        26637 +/- 29 
## Douglas County, Wisconsin     41467 +/- 64 
## Dunn County, Wisconsin        41528 +/- 55 
## Eau Claire County, Wisconsin  94010 +/- 28 
## Florence County, Wisconsin    4244 +/- 51  
## Fond du Lac County, Wisconsin 95847 +/- 10 
## Forest County, Wisconsin      8777 +/- 16  
## Grant County, Wisconsin       48227 +/- 47 
## Green County, Wisconsin       34654 +/- 28 
## Green Lake County, Wisconsin  18020 +/- 44 
## Iowa County, Wisconsin        22156 +/- 39 
## Iron County, Wisconsin        5726 +/- 7   
## Jackson County, Wisconsin     19251 +/- 6  
## Jefferson County, Wisconsin   79016 +/- 53 
## Juneau County, Wisconsin      25190 +/- 60 
## Kenosha County, Wisconsin     156252 +/- 89
## Kewaunee County, Wisconsin    19458 +/- 59 
## La Crosse County, Wisconsin   108711 +/- 47
## Lafayette County, Wisconsin   15753 +/- 35 
## Langlade County, Wisconsin    18808 +/- 67 
## Lincoln County, Wisconsin     27291 +/- 39 
## Manitowoc County, Wisconsin   76707 +/- 55 
## Marathon County, Wisconsin    125880 +/- 0 
## Marinette County, Wisconsin   39642 +/- 57 
## Marquette County, Wisconsin   14548 +/- 22 
## Menominee County, Wisconsin   3909 +/- 51  
## Milwaukee County, Wisconsin   881215 +/- 16
## Monroe County, Wisconsin      41726 +/- 48 
## Oconto County, Wisconsin      35515 +/- 40 
## Oneida County, Wisconsin      34187 +/- 90 
## Outagamie County, Wisconsin   166383 +/- 0 
## Ozaukee County, Wisconsin     82277 +/- 74 
## Pepin County, Wisconsin       6978 +/- 11  
## Pierce County, Wisconsin      38572 +/- 45 
## Polk County, Wisconsin        41383 +/- 29 
## Portage County, Wisconsin     66349 +/- 88 
## Price County, Wisconsin       13424 +/- 18 
## Racine County, Wisconsin      182471 +/- 0 
## Richland County, Wisconsin    16866 +/- 35 
## Rock County, Wisconsin        150230 +/- 0 
## Rusk County, Wisconsin        13787 +/- 12 
## St. Croix County, Wisconsin   79001 +/- 28 
## Sauk County, Wisconsin        58420 +/- 102
## Sawyer County, Wisconsin      15575 +/- 36 
## Shawano County, Wisconsin     39472 +/- 12 
## Sheboygan County, Wisconsin   108352 +/- 24
## Taylor County, Wisconsin      19340 +/- 28 
## Trempealeau County, Wisconsin 27141 +/- 42 
## Vernon County, Wisconsin      27896 +/- 27 
## Vilas County, Wisconsin       20545 +/- 11 
## Walworth County, Wisconsin    96736 +/- 66 
## Washburn County, Wisconsin    15030 +/- 18 
## Washington County, Wisconsin  124510 +/- 6 
## Waukesha County, Wisconsin    370252 +/- 26
## Waupaca County, Wisconsin     49457 +/- 40 
## Waushara County, Wisconsin    23289 +/- 24 
## Winnebago County, Wisconsin   158166 +/- 44
## Wood County, Wisconsin        70052 +/- 106
```
