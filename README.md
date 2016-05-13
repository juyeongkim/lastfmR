lastfmr
================

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
    ##   ..$ name      : chr [1:5] "Courtney Barnett" "Kendrick Lamar" "Andrew Bird" "Sigur Rós" ...
    ##   ..$ playcount : chr [1:5] "75" "57" "56" "44" ...
    ##   ..$ mbid      : chr [1:5] "55111838-f001-494a-a1b5-9d818db85810" "381086ea-f511-4aba-bdf9-71c753dc5077" "081b133e-ce74-42ba-92c1-c18234acb532" "f6f2326f-6b25-4170-b89d-e235b25508e8" ...
    ##   ..$ url       : chr [1:5] "http://www.last.fm/music/Courtney+Barnett" "http://www.last.fm/music/Kendrick+Lamar" "http://www.last.fm/music/Andrew+Bird" "http://www.last.fm/music/Sigur+R%C3%B3s" ...
    ##   ..$ streamable: chr [1:5] "0" "0" "0" "0" ...
    ##   ..$ image     :List of 5
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "http://img2-ak.lst.fm/i/u/34s/b6626cc7e4904defcd8f4717b34e1c65.png" "http://img2-ak.lst.fm/i/u/64s/b6626cc7e4904defcd8f4717b34e1c65.png" "http://img2-ak.lst.fm/i/u/174s/b6626cc7e4904defcd8f4717b34e1c65.png" "http://img2-ak.lst.fm/i/u/300x300/b6626cc7e4904defcd8f4717b34e1c65.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "http://img2-ak.lst.fm/i/u/34s/23c66bf788f09ee36d5e3f4f80cb0004.png" "http://img2-ak.lst.fm/i/u/64s/23c66bf788f09ee36d5e3f4f80cb0004.png" "http://img2-ak.lst.fm/i/u/174s/23c66bf788f09ee36d5e3f4f80cb0004.png" "http://img2-ak.lst.fm/i/u/300x300/23c66bf788f09ee36d5e3f4f80cb0004.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "http://img2-ak.lst.fm/i/u/34s/3cce1dd61d2246b19819b75cfe541a00.png" "http://img2-ak.lst.fm/i/u/64s/3cce1dd61d2246b19819b75cfe541a00.png" "http://img2-ak.lst.fm/i/u/174s/3cce1dd61d2246b19819b75cfe541a00.png" "http://img2-ak.lst.fm/i/u/300x300/3cce1dd61d2246b19819b75cfe541a00.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "http://img2-ak.lst.fm/i/u/34s/e273c8c0620a4f6bb400a57aa615c068.png" "http://img2-ak.lst.fm/i/u/64s/e273c8c0620a4f6bb400a57aa615c068.png" "http://img2-ak.lst.fm/i/u/174s/e273c8c0620a4f6bb400a57aa615c068.png" "http://img2-ak.lst.fm/i/u/300x300/e273c8c0620a4f6bb400a57aa615c068.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   .. ..$ :'data.frame':  5 obs. of  2 variables:
    ##   .. .. ..$ #text: chr [1:5] "http://img2-ak.lst.fm/i/u/34s/f48930d08bfc7c2caf7631d6bdcdb91c.png" "http://img2-ak.lst.fm/i/u/64s/f48930d08bfc7c2caf7631d6bdcdb91c.png" "http://img2-ak.lst.fm/i/u/174s/f48930d08bfc7c2caf7631d6bdcdb91c.png" "http://img2-ak.lst.fm/i/u/300x300/f48930d08bfc7c2caf7631d6bdcdb91c.png" ...
    ##   .. .. ..$ size : chr [1:5] "small" "medium" "large" "extralarge" ...
    ##   ..$ @attr     :'data.frame':   5 obs. of  1 variable:
    ##   .. ..$ rank: chr [1:5] "1" "2" "3" "4" ...
    ##  $ @attr :List of 5
    ##   ..$ user      : chr "platyjus"
    ##   ..$ page      : chr "1"
    ##   ..$ perPage   : chr "5"
    ##   ..$ totalPages: chr "24"
    ##   ..$ total     : chr "117"

``` r
top5$artist$name
```

    ## [1] "Courtney Barnett" "Kendrick Lamar"   "Andrew Bird"     
    ## [4] "Sigur Rós"        "The Suffers"

### Get album information

``` r
fearfun <- album_getInfo("Father John Misty", "Fear Fun")

str(fearfun)
```

    ## List of 9
    ##  $ name     : chr "Fear Fun"
    ##  $ artist   : chr "Father John Misty"
    ##  $ mbid     : chr "da07a173-bf3d-4e7e-995d-ce473ce83030"
    ##  $ url      : chr "http://www.last.fm/music/Father+John+Misty/Fear+Fun"
    ##  $ image    :'data.frame':   6 obs. of  2 variables:
    ##   ..$ #text: chr [1:6] "http://img2-ak.lst.fm/i/u/34s/eb6d481db082302430574f5c58fc1e73.png" "http://img2-ak.lst.fm/i/u/64s/eb6d481db082302430574f5c58fc1e73.png" "http://img2-ak.lst.fm/i/u/174s/eb6d481db082302430574f5c58fc1e73.png" "http://img2-ak.lst.fm/i/u/300x300/eb6d481db082302430574f5c58fc1e73.png" ...
    ##   ..$ size : chr [1:6] "small" "medium" "large" "extralarge" ...
    ##  $ listeners: chr "185013"
    ##  $ playcount: chr "3839039"
    ##  $ tracks   :List of 1
    ##   ..$ track:'data.frame':    12 obs. of  6 variables:
    ##   .. ..$ name      : chr [1:12] "Funtimes in Babylon" "Nancy From Now On" "Hollywood Forever Cemetery Sings" "I'm Writing a Novel" ...
    ##   .. ..$ url       : chr [1:12] "http://www.last.fm/music/Father+John+Misty/_/Funtimes+in+Babylon" "http://www.last.fm/music/Father+John+Misty/_/Nancy+From+Now+On" "http://www.last.fm/music/Father+John+Misty/_/Hollywood+Forever+Cemetery+Sings" "http://www.last.fm/music/Father+John+Misty/_/I%27m+Writing+a+Novel" ...
    ##   .. ..$ duration  : chr [1:12] "217" "228" "191" "215" ...
    ##   .. ..$ @attr     :'data.frame':    12 obs. of  1 variable:
    ##   .. .. ..$ rank: chr [1:12] "1" "2" "3" "4" ...
    ##   .. ..$ streamable:'data.frame':    12 obs. of  2 variables:
    ##   .. .. ..$ #text    : chr [1:12] "0" "0" "0" "0" ...
    ##   .. .. ..$ fulltrack: chr [1:12] "0" "0" "0" "0" ...
    ##   .. ..$ artist    :'data.frame':    12 obs. of  3 variables:
    ##   .. .. ..$ name: chr [1:12] "Father John Misty" "Father John Misty" "Father John Misty" "Father John Misty" ...
    ##   .. .. ..$ mbid: chr [1:12] "172053e5-a7fb-4548-a64d-c53858b5e775" "172053e5-a7fb-4548-a64d-c53858b5e775" "172053e5-a7fb-4548-a64d-c53858b5e775" "172053e5-a7fb-4548-a64d-c53858b5e775" ...
    ##   .. .. ..$ url : chr [1:12] "http://www.last.fm/music/Father+John+Misty" "http://www.last.fm/music/Father+John+Misty" "http://www.last.fm/music/Father+John+Misty" "http://www.last.fm/music/Father+John+Misty" ...
    ##  $ tags     :List of 1
    ##   ..$ tag:'data.frame':  5 obs. of  2 variables:
    ##   .. ..$ name: chr [1:5] "2012" "best of 2012" "availableonemusic" "rock" ...
    ##   .. ..$ url : chr [1:5] "http://www.last.fm/tag/2012" "http://www.last.fm/tag/best+of+2012" "http://www.last.fm/tag/availableonemusic" "http://www.last.fm/tag/rock" ...

``` r
fearfun$tracks$track[c("name", "duration")]
```

    ##                                    name duration
    ## 1                   Funtimes in Babylon      217
    ## 2                     Nancy From Now On      228
    ## 3      Hollywood Forever Cemetery Sings      191
    ## 4                   I'm Writing a Novel      215
    ## 5  O I Long to Feel Your Arms Around Me      143
    ## 6              Misty's Nightmares 1 & 2      193
    ## 7             Only Son of the Ladiesman      249
    ## 8                 This Is Sally Hatchet      237
    ## 9        Well, You Can Do It Without Me      163
    ## 10     Now I'm Learning to Love the War      256
    ## 11                        Tee Pees 1-12      196
    ## 12           Everyman Needs a Companion      302

### Shiny App: lastfm explorer

<https://juyeongkim.shinyapps.io/lastfm-explorer/>
