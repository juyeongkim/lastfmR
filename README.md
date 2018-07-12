lastfmr
================

[![Build Status](https://travis-ci.org/juyeongkim/lastfmr.svg?branch=master)](https://travis-ci.org/juyeongkim/lastfmr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/juyeongkim/lastfmr?branch=master&svg=true)](https://ci.appveyor.com/project/juyeongkim/lastfmr) [![codecov](https://codecov.io/gh/juyeongkim/lastfmr/branch/master/graph/badge.svg)](https://codecov.io/gh/juyeongkim/lastfmr) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/lastfmr)](https://cran.r-project.org/package=lastfmr) ![](http://cranlogs.r-pkg.org/badges/lastfmr?color=yellow) ![](http://cranlogs.r-pkg.org/badges/grand-total/lastfmr?color=yellowgreen)

**WORK IN PROGRESS**

`lastfmr` is an R interface to [Last.fm](http://www.last.fm/api).

Installation
------------

``` r
install.packages("devtools")
devtools::install_github("juyeongkim/lastfmr")
```

Get API Key
-----------

-   [Create an API account](http://www.last.fm/api/account/create)
-   Read [API Terms of Service](https://www.last.fm/api/tos)
-   Copy and save the API key somewhere safe
-   On your R console, set environment variable with your API key:

``` r
Sys.setenv(lastfm_key = "yourAPIKey")
```

Examples
--------

### Get user's top 5 artists

``` r
library(lastfmr)
top5 <- user_getTopArtists("platyjus", limit = 5)

dplyr::glimpse(top5)
```

    ## Observations: 5
    ## Variables: 10
    ## $ name             <chr> "Leon Bridges", "::M∆DE::IN::HEIGHTS::", "The...
    ## $ playcount        <chr> "295", "290", "251", "233", "222"
    ## $ mbid             <chr> "", "72c9f2ac-12ca-4a2a-ae79-6b19bd1e5b73", "...
    ## $ url              <chr> "https://www.last.fm/music/Leon+Bridges", "ht...
    ## $ streamable       <chr> "0", "0", "0", "0", "0"
    ## $ image.extralarge <chr> "https://lastfm-img2.akamaized.net/i/u/300x30...
    ## $ image.large      <chr> "https://lastfm-img2.akamaized.net/i/u/174s/4...
    ## $ image.medium     <chr> "https://lastfm-img2.akamaized.net/i/u/64s/4e...
    ## $ image.small      <chr> "https://lastfm-img2.akamaized.net/i/u/34s/4e...
    ## $ `@attr.rank`     <chr> "1", "2", "3", "4", "5"

``` r
top5$name
```

    ## [1] "Leon Bridges"          "::M∆DE::IN::HEIGHTS::" "The Lumineers"        
    ## [4] "Lisa Hannigan"         "Kendrick Lamar"

### Get album information

``` r
fearfun <- album_getInfo("Father John Misty", "Fear Fun")

dplyr::glimpse(fearfun)
```

    ## Observations: 1
    ## Variables: 12
    ## $ name             <chr> "Fear Fun"
    ## $ artist           <chr> "Father John Misty"
    ## $ mbid             <chr> "da07a173-bf3d-4e7e-995d-ce473ce83030"
    ## $ url              <chr> "https://www.last.fm/music/Father+John+Misty/...
    ## $ image.extralarge <chr> "https://lastfm-img2.akamaized.net/i/u/300x30...
    ## $ image.large      <chr> "https://lastfm-img2.akamaized.net/i/u/174s/2...
    ## $ image.medium     <chr> "https://lastfm-img2.akamaized.net/i/u/64s/24...
    ## $ image.small      <chr> "https://lastfm-img2.akamaized.net/i/u/34s/24...
    ## $ listeners        <chr> "249377"
    ## $ playcount        <chr> "4985944"
    ## $ tracks           <list> [<c("Funtimes in Babylon", "Nancy From Now O...
    ## $ tags             <list> [<c("2012", "best of 2012", "availableonemus...

``` r
fearfun$tracks[[1]][, c("name", "duration")]
```

    ##                                    name duration
    ## 1                   Funtimes in Babylon      220
    ## 2                     Nancy From Now On      234
    ## 3      Hollywood Forever Cemetery Sings      191
    ## 4                   I'm Writing a Novel      215
    ## 5  O I Long to Feel Your Arms Around Me      143
    ## 6              Misty's Nightmares 1 & 2      193
    ## 7             Only Son of the Ladiesman      249
    ## 8                 This Is Sally Hatchet      238
    ## 9        Well, You Can Do It Without Me      163
    ## 10     Now I'm Learning to Love the War      262
    ## 11                        Tee Pees 1-12      196
    ## 12           Everyman Needs a Companion      320
