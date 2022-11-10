
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wetried

Names: Chi Qiu, Meaghan Brennan, and Emma Gardecki

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/wetried2)](https://CRAN.R-project.org/package=wetried2)

<!-- badges: end -->

The goal of wetried is to …

## Installation

You can install the development version of wetried2 like so:

``` r
devtools::install_github("chiqiu23/wetried")
#> Skipping install of 'wetried2' from a github remote, the SHA1 (0774cdcf) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Load

``` r
library(wetried2)
## basic example code
```

## Available Tables

-   `smith_wbb_data`: dataset of Smith College women basketball games

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

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
