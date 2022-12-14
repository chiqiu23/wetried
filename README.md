
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wetried2

Names: Chi Qiu, Meaghan Brennan, and Emma Gardecki

<!-- badges: start -->

[<img
src="https://img.shields.io/badge/lifecycle-experimental-orange.svg"
alt="Lifecycle: experimental" />](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[<img src="https://www.r-pkg.org/badges/version/wetried2"
alt="CRAN status" />](https://CRAN.R-project.org/package=wetried2) [<img
src="https://github.com/chiqiu23/wetried/actions/workflows/R-CMD-check.yaml/badge.svg"
alt="R-CMD-check" />](https://github.com/chiqiu23/wetried/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

## Purpose

The purpose of `wetried2` package is to be a Smith College basketball
version of the nbastatr package, but in a simpler form. It uses the
season totals as provided on the Smith Athletics website and will all
for users to calculate advanced stats on their own, such as TS%, and
provide visualizations for analysis.

## Target Audience

Users who may be interested in this package would be anyone interested
in Smith College’s basketball team, as well as anyone interested in
sports analytics and specifically basketball analytics. This package
also provides a useful way for coaches to learn more about the team and
how to improve it.

## Installation

You can install the development version of `wetried2` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("chiqiu23/wetried")
```

## Load

``` r
library(wetried2) 
#> Loading required package: ggplot2
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> Loading required package: stringr
```

## Available Datasets

-   `smith_wbb_data`: dataset of Smith College Women Basketball Games
    for 2010-2022 season (with exception for the 2019-2020 season that
    was disrupted by the Covid-19 Pandemic)
-   `smith_oppwbb_data`: dataset of opponents of Smith College Women
    Basketball Games for 2010-2022 (with exception for the 2019-2020
    season that was disrupted by the Covid-19 Pandemic)

## Available functions

-   `TS_percentage()`: calculate TS% or True Shooting Percentage from
    the Smith WBB dataset
-   `perform_players()`: compare field goals attempted for two selected
    players across one season
-   `ast_turnover_ratio()`: calculate the assist to turnover ratio of a
    player from the Smith WBB dataset
-   `offensive_rating()`: calculate the offensive rating of a player
    from the Smith WBB dataset and Opponents’ of Smith WBB dataset

## Example: 2010-2022 Cumulative Statistics for Smith College Women Basketball Game

``` r
head(smith_wbb_data)
#> # A tibble: 6 × 27
#>   number player     gp    gs   tot   avg   fgm   fga fg_pe…¹  x3pt x3pta x3pt_…²
#>    <dbl> <chr>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>   <dbl> <dbl> <dbl>   <dbl>
#> 1     11 Pickun…    28    28   697  24.9   119   226   0.527     5    12   0.417
#> 2     14 Ruffne…    28    28   769  27.5   127   260   0.488    22    55   0.4  
#> 3     22 Morris…    28     2   451  16.1   127   204   0.623     0     0   0    
#> 4      5 Yamada…    28     6   579  20.7    72   192   0.375    39   120   0.325
#> 5     25 Clairm…    25    21   542  21.7    69   189   0.365    34   102   0.333
#> 6     10 Gleiss…    28    28   754  26.9    67   175   0.383    26    82   0.317
#> # … with 15 more variables: ftm <dbl>, fta <dbl>, ft_percent <dbl>, pts <dbl>,
#> #   avg_2 <dbl>, off <dbl>, def <dbl>, tot_2 <dbl>, avg_3 <dbl>, pf <dbl>,
#> #   ast <dbl>, to <dbl>, stl <dbl>, blk <dbl>, season <chr>, and abbreviated
#> #   variable names ¹​fg_percent, ²​x3pt_percent
```

### Calculate True Shooting Percentage

``` r
TS_percentage(input_player = "Bondi, Lauren", input_season = "2018-19")
#> [1] 56.037
```

### Calculate Assist to Turnover Ratio Calculation

``` r
ast_turnover_ratio(input_player = "Pickunka, Katelyn", input_season = "2021-22")
#> [1] 0.462963
```

### Compare Field Goals Attempted of Two Players

``` r
perform_players(player_num1 = 10, player_num2 = 22, input_season = "2021-22")
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

## Example: 2010-2022 Cumulative Statistics for Opponents of Smith College Women Basketball Game

``` r
head(smith_oppwbb_data)
#> # A tibble: 6 × 25
#>   opponent   date       score w_l     fgm   fga fg_pct x3fgm x3fga x3fg_…¹   ftm
#>   <chr>      <date>     <chr> <chr> <dbl> <dbl>  <dbl> <dbl> <dbl>   <dbl> <dbl>
#> 1 Castleton  2021-11-08 57-78 L        18    64  0.281     6    22   0.273    15
#> 2 Vassar     2021-11-13 55-80 L        20    70  0.286    10    41   0.244     5
#> 3 Rowan      2021-11-14 55-70 L        23    69  0.333     4    15   0.267     5
#> 4 Mitchell   2021-11-19 50-69 L        22    73  0.301     3    18   0.167     3
#> 5 Bowdoin    2021-11-20 69-52 W        27    56  0.482    11    19   0.579     4
#> 6 Trinity (… 2021-11-28 58-65 L        21    49  0.429     2    12   0.167    14
#> # … with 14 more variables: fta <dbl>, ft_pct <dbl>, off <dbl>, def <dbl>,
#> #   tot <dbl>, avg <dbl>, pf <dbl>, ast <dbl>, to <dbl>, blk <dbl>, stl <dbl>,
#> #   pts <dbl>, avg_2 <dbl>, season <chr>, and abbreviated variable name
#> #   ¹​x3fg_pct
```

### Calculate Offensive Rating of the Player

``` r
offensive_rating(input_player = "Bondi, Lauren", input_season = "2018-19")
#> [1] 129.2734
```

## Contributors

-   [Chi Qiu](https://github.com/chiqiu23)

-   [Meaghan Brennan](https://github.com/teenyss)

-   [Emma Gardecki](https://github.com/emmagardecki)
