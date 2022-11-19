
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
#> Downloading GitHub repo chiqiu23/wetried@HEAD
#> * checking for file ‘/private/var/folders/bp/j7r3nznd45z5cjjfx14h0snc0000gp/T/RtmpVnqS8N/remotesa4eb1649d8ed/chiqiu23-wetried-7488438/DESCRIPTION’ ... OK
#> * preparing ‘wetried2’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘wetried2_0.0.0.9000.tar.gz’
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
library(readr)
smith_wbb_data <- read_csv("smith_wbb_data.csv")
#> Rows: 153 Columns: 27
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr  (3): number, player, season
#> dbl (24): gp, gs, tot, avg, fgm, fga, fg_percent, x3pt, x3pta, x3pt_percent,...
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
head(smith_wbb_data)
#> # A tibble: 6 × 27
#>   number player     gp    gs   tot   avg   fgm   fga fg_pe…¹  x3pt x3pta x3pt_…²
#>   <chr>  <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>   <dbl> <dbl> <dbl>   <dbl>
#> 1 11     "Picku…    28    28   697  24.9   119   226   0.527     5    12   0.417
#> 2 14     "Ruffn…    28    28   769  27.5   127   260   0.488    22    55   0.4  
#> 3 22     "Morri…    28     2   451  16.1   127   204   0.623     0     0   0    
#> 4 05     "Yamad…    28     6   579  20.7    72   192   0.375    39   120   0.325
#> 5 25     "Clair…    25    21   542  21.7    69   189   0.365    34   102   0.333
#> 6 10     "Gleis…    28    28   754  26.9    67   175   0.383    26    82   0.317
#> # … with 15 more variables: ftm <dbl>, fta <dbl>, ft_percent <dbl>, pts <dbl>,
#> #   avg_2 <dbl>, off <dbl>, def <dbl>, tot_2 <dbl>, avg_3 <dbl>, pf <dbl>,
#> #   ast <dbl>, to <dbl>, stl <dbl>, blk <dbl>, season <chr>, and abbreviated
#> #   variable names ¹​fg_percent, ²​x3pt_percent
```

### Data Visualization

### Functionality

## Contributors

-   [Chi Qiu](https://github.com/chiqiu23)

-   [Meaghan Brennan](https://github.com/teenyss)

-   [Emma Gardecki](https://github.com/emmagardecki)
