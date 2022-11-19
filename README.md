
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wetried

Names: Chi Qiu, Meaghan Brennan, and Emma Gardecki

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/wetried2)](https://CRAN.R-project.org/package=wetried2)

<!-- badges: end -->

## Purpose

The goal of `wetried` package is to be a Smith College version of the
nbastatr package – with it, you can see the Smith College basketball
team’s stats and calculate various advanced stats and any important
numbers that are useful for evaluating the performance of a basketball
game.

## Target Audience

Anyone who is interested in analyzing the performance of Smith College
basketball games. This package also provides a useful way for coaches to
learn more about the team and how to improve it.

## Installation

You can install IPEDS from [CRAN](https://cran.r-project.org/) with:

``` r
#install.packages("wetried2")
```

You can install the development version of wetried2 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("chiqiu23/wetried")
#> Skipping install of 'wetried2' from a github remote, the SHA1 (1a400e62) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Load

``` r
library(wetried2) 
```

## Available Tables

-   `smith_wbb_data`: dataset of Smith College Women Basketball Games
    for 2010-2022 season

## Example: 2010-2022 Cumulative Statistics for Smith College Women Basketball Game

``` r
head(smith_wbb_data)
#>   number                  player gp gs tot  avg fgm fga fg_percent x3pt x3pta
#> 1     11   Pickunka, Katelyn\r\n 28 28 697 24.9 119 226      0.527    5    12
#> 2     14     Ruffner, Jessie\r\n 28 28 769 27.5 127 260      0.488   22    55
#> 3     22    Morrison, Morgan\r\n 28  2 451 16.1 127 204      0.623    0     0
#> 4     05        Yamada, Ally\r\n 28  6 579 20.7  72 192      0.375   39   120
#> 5     25   Clairmont, Amelia\r\n 25 21 542 21.7  69 189      0.365   34   102
#> 6     10 Gleissner, Dashelle\r\n 28 28 754 26.9  67 175      0.383   26    82
#>   x3pt_percent ftm fta ft_percent pts avg_2 off def tot_2 avg_3 pf ast to stl
#> 1        0.417  72 101      0.713 315  11.3  73 139   212   7.6 60  25 54  28
#> 2        0.400  35  48      0.729 311  11.1  21 108   129   4.6 53  74 48  27
#> 3        0.000  58  86      0.674 312  11.1  70  95   165   5.9 61  13 47  11
#> 4        0.325  33  44      0.750 216   7.7   8  34    42   1.5 39  61 51  24
#> 5        0.333  10  12      0.833 182   7.3   7  49    56   2.2 33  27 40  18
#> 6        0.317  23  35      0.657 183   6.5   7  78    85   3.0 50 138 65  76
#>   blk  season
#> 1  12 2021-22
#> 2   2 2021-22
#> 3   9 2021-22
#> 4   0 2021-22
#> 5   3 2021-22
#> 6   8 2021-22
```

### Data Visualization

### Functionality

## Contributors

-   [Chi Qiu](https://github.com/chiqiu23)

-   [Meaghan Brennan](https://github.com/teenyss)

-   [Emma Gardecki](https://github.com/emmagardecki)
