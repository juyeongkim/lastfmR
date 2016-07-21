lastfmr
================

[![Build Status](https://travis-ci.org/juyeongkim/lastfmr.svg?branch=master)](https://travis-ci.org/juyeongkim/lastfmr)

lastfmr is an R interface to [Last.fm](http://www.last.fm/api). This is a port of Greg Hirson's [RLastFM](https://cran.r-project.org/package=RLastFM) (last updated 2009-08-24).

Installation
------------

``` r
# install.packages("devtools")
devtools::install_github("juyeongkim/lastfmr")
```

Examples
--------

### Get user's top 5 artists

``` r
library(lastfmr)

top5 <- user_getTopArtists("platyjus", limit = 5)

str(top5)
```

    ## List of 2
    ##  $ artist:'data.frame':  5 obs. of  7 variables:
    ##   ..$ name      : chr [1:5] "::M∆DE::IN::HEIGHTS::" "Anderson Paak" "Leon Bridges" "Andrew Bird" ...
    ##   ..$ playcount : chr [1:5] "154" "115" "104" "89" ...
    ##   ..$ mbid      : chr [1:5] "72c9f2ac-12ca-4a2a-ae79-6b19bd1e5b73" "d02dd67e-f655-4600-bc47-f789f59e7367" "" "081b133e-ce74-42ba-92c1-c18234acb532" ...
    ##   ..$ url       : chr [1:5] "https://www.last.fm/music/::M%E2%88%86DE::IN::HEIGHTS::" "https://www.last.fm/music/Anderson+Paak" "https://www.last.fm/music/Leon+Bridges" "https://www.last.fm/music/Andrew+Bird" ...
    ##   ..$ streamable: chr [1:5] "0" "0" "0" "0" ...
    ##   ..$ image     :List of 5
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "https://lastfm-img2.akamaized.net/i/u/34s/2b45cccc6ca247a6c78cca6ace9c2114.png" "https://lastfm-img2.akamaized.net/i/u/64s/2b45cccc6ca247a6c78cca6ace9c2114.png" "https://lastfm-img2.akamaized.net/i/u/174s/2b45cccc6ca247a6c78cca6ace9c2114.png" "https://lastfm-img2.akamaized.net/i/u/300x300/2b45cccc6ca247a6c78cca6ace9c2114.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "https://lastfm-img2.akamaized.net/i/u/34s/e009139061502922de33ed960c5fac9c.png" "https://lastfm-img2.akamaized.net/i/u/64s/e009139061502922de33ed960c5fac9c.png" "https://lastfm-img2.akamaized.net/i/u/174s/e009139061502922de33ed960c5fac9c.png" "https://lastfm-img2.akamaized.net/i/u/300x300/e009139061502922de33ed960c5fac9c.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "https://lastfm-img2.akamaized.net/i/u/34s/ffc9f3cde0e445b3c5b9cb7c3cd36ebf.png" "https://lastfm-img2.akamaized.net/i/u/64s/ffc9f3cde0e445b3c5b9cb7c3cd36ebf.png" "https://lastfm-img2.akamaized.net/i/u/174s/ffc9f3cde0e445b3c5b9cb7c3cd36ebf.png" "https://lastfm-img2.akamaized.net/i/u/300x300/ffc9f3cde0e445b3c5b9cb7c3cd36ebf.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "https://lastfm-img2.akamaized.net/i/u/34s/3bfd399d774f4441911068f270cd06c4.png" "https://lastfm-img2.akamaized.net/i/u/64s/3bfd399d774f4441911068f270cd06c4.png" "https://lastfm-img2.akamaized.net/i/u/174s/3bfd399d774f4441911068f270cd06c4.png" "https://lastfm-img2.akamaized.net/i/u/300x300/3bfd399d774f4441911068f270cd06c4.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "https://lastfm-img2.akamaized.net/i/u/34s/b6626cc7e4904defcd8f4717b34e1c65.png" "https://lastfm-img2.akamaized.net/i/u/64s/b6626cc7e4904defcd8f4717b34e1c65.png" "https://lastfm-img2.akamaized.net/i/u/174s/b6626cc7e4904defcd8f4717b34e1c65.png" "https://lastfm-img2.akamaized.net/i/u/300x300/b6626cc7e4904defcd8f4717b34e1c65.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   ..$ @attr     :'data.frame':   5 obs. of  1 variable:
    ##   .. ..$ rank: chr [1:5] "1" "2" "3" "4" ...
    ##  $ @attr :List of 5
    ##   ..$ user      : chr "platyjus"
    ##   ..$ page      : chr "1"
    ##   ..$ perPage   : chr "5"
    ##   ..$ totalPages: chr "51"
    ##   ..$ total     : chr "253"

``` r
top5$artist$name
```

    ## [1] "::M∆DE::IN::HEIGHTS::" "Anderson Paak"         "Leon Bridges"         
    ## [4] "Andrew Bird"           "Courtney Barnett"

### Get album information

``` r
fearfun <- album_getInfo("Father John Misty", "Fear Fun")

str(fearfun)
```

    ## List of 9
    ##  $ name     : chr "Fear Fun"
    ##  $ artist   : chr "Father John Misty"
    ##  $ mbid     : chr "da07a173-bf3d-4e7e-995d-ce473ce83030"
    ##  $ url      : chr "https://www.last.fm/music/Father+John+Misty/Fear+Fun"
    ##  $ image    :'data.frame':   6 obs. of  2 variables:
    ##   ..$ #text: chr [1:6] "https://lastfm-img2.akamaized.net/i/u/34s/d9839e4cfadb49909637e9b6e39caa95.png" "https://lastfm-img2.akamaized.net/i/u/64s/d9839e4cfadb49909637e9b6e39caa95.png" "https://lastfm-img2.akamaized.net/i/u/174s/d9839e4cfadb49909637e9b6e39caa95.png" "https://lastfm-img2.akamaized.net/i/u/300x300/d9839e4cfadb49909637e9b6e39caa95.png" ...
    ##   ..$ size : chr [1:6] "small" "medium" "large" "extralarge" ...
    ##  $ listeners: chr "190683"
    ##  $ playcount: chr "3950713"
    ##  $ tracks   :List of 1
    ##   ..$ track:'data.frame':    12 obs. of  6 variables:
    ##   .. ..$ name      : chr [1:12] "Funtimes in Babylon" "Nancy From Now On" "Hollywood Forever Cemetery Sings" "I'm Writing a Novel" ...
    ##   .. ..$ url       : chr [1:12] "https://www.last.fm/music/Father+John+Misty/_/Funtimes+in+Babylon" "https://www.last.fm/music/Father+John+Misty/_/Nancy+From+Now+On" "https://www.last.fm/music/Father+John+Misty/_/Hollywood+Forever+Cemetery+Sings" "https://www.last.fm/music/Father+John+Misty/_/I%27m+Writing+a+Novel" ...
    ##   .. ..$ duration  : chr [1:12] "217" "234" "190" "215" ...
    ##   .. ..$ @attr     :'data.frame':    12 obs. of  1 variable:
    ##   .. .. ..$ rank: chr [1:12] "1" "2" "3" "4" ...
    ##   .. ..$ streamable:'data.frame':    12 obs. of  2 variables:
    ##   .. .. ..$ #text    : chr [1:12] "0" "0" "0" "0" ...
    ##   .. .. ..$ fulltrack: chr [1:12] "0" "0" "0" "0" ...
    ##   .. ..$ artist    :'data.frame':    12 obs. of  3 variables:
    ##   .. .. ..$ name: chr [1:12] "Father John Misty" "Father John Misty" "Father John Misty" "Father John Misty" ...
    ##   .. .. ..$ mbid: chr [1:12] "172053e5-a7fb-4548-a64d-c53858b5e775" "172053e5-a7fb-4548-a64d-c53858b5e775" "172053e5-a7fb-4548-a64d-c53858b5e775" "172053e5-a7fb-4548-a64d-c53858b5e775" ...
    ##   .. .. ..$ url : chr [1:12] "https://www.last.fm/music/Father+John+Misty" "https://www.last.fm/music/Father+John+Misty" "https://www.last.fm/music/Father+John+Misty" "https://www.last.fm/music/Father+John+Misty" ...
    ##  $ tags     :List of 1
    ##   ..$ tag:'data.frame':  5 obs. of  2 variables:
    ##   .. ..$ name: chr [1:5] "2012" "best of 2012" "availableonemusic" "rock" ...
    ##   .. ..$ url : chr [1:5] "https://www.last.fm/tag/2012" "https://www.last.fm/tag/best+of+2012" "https://www.last.fm/tag/availableonemusic" "https://www.last.fm/tag/rock" ...

``` r
fearfun$tracks$track[c("name", "duration")]
```

    ##                                    name duration
    ## 1                   Funtimes in Babylon      217
    ## 2                     Nancy From Now On      234
    ## 3      Hollywood Forever Cemetery Sings      190
    ## 4                   I'm Writing a Novel      215
    ## 5  O I Long to Feel Your Arms Around Me      143
    ## 6              Misty's Nightmares 1 & 2      193
    ## 7             Only Son of the Ladiesman      249
    ## 8                 This Is Sally Hatchet      237
    ## 9        Well, You Can Do It Without Me      163
    ## 10     Now I'm Learning to Love the War      257
    ## 11                        Tee Pees 1-12      197
    ## 12           Everyman Needs a Companion      302

### Shiny App: lastfm explorer

<https://juyeongkim.shinyapps.io/lastfm-explorer/>
