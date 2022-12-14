library(tidyverse)
library(janitor)
smith_wbb_data<-read_csv("data-raw/smith_wbb_data.csv") %>%
  clean_names()

smith_oppwbb_data <- read_csv("data-raw/smith_oppwbb_data.csv") %>%
  clean_names

usethis::use_data(smith_wbb_data, overwrite = TRUE)
usethis::use_data(smith_oppwbb_data, overwrite = TRUE)
