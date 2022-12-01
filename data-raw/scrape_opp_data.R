## tutorial adapted from https://ivanmillanes.netlify.app/post/2020-06-30-webscraping-with-rselenium-and-rvest/

library(tidyverse)
library(janitor)
library(rvest)
library(RSelenium)
library(robotstxt)

## run these in your console first to load Selenium server in Google Chrome
# rD <- RSelenium::rsDriver()
# remDr <- rD[["client"]]

#check if allowed to scrape
paths_allowed("https://smithpioneers.com/sports/womens-basketball/stats/2010-11") #TRUE , all good

## 2010-11 SEASON
#opens site in server
remDr$open()
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2010-11")
# Give some time to load
Sys.sleep(4)
# Increase window size to find elements
remDr$maxWindowSize()

# Accept cookies
# acceptCookies <- remDr$findElement(using = "css selector",
#                                    value = "div[class='btn-primary cookies-notice-accept']")
# acceptCookies$clickElement()

# Read page source
source <- remDr$getPageSource()[[1]]

# Get opponentStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
# dat <- df[-1, ] %>%
dat <- df %>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2010-11") %>%
  slice_head(n=12)
data_full <- dat

## 2011-12 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2011-12")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df %>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2011-12") %>%
  slice_head(n=13)
data_full <- rbind(dat,data_full)

## 2012-13 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2012-13")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df%>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2012-13") %>%
  slice_head(n=12)
data_full <- rbind(dat,data_full)

## 2013-14 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2013-14")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df %>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2013-14") %>%
  slice_head(n=11)
data_full <- rbind(dat,data_full)

## 2014-15 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2014-15")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df %>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2014-15") %>%
  slice_head(n=14)
data_full <- rbind(dat,data_full)

## 2015-16 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2015-16")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df%>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2015-16") %>%
  slice_head(n=18)
data_full <- rbind(dat,data_full)

## 2016-17 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2016-17")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df %>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2016-17") %>%
  slice_head(n=15)
data_full <- rbind(dat,data_full)

## 2017-18 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2017-18")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df %>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2017-18") %>%
  slice_head(n=14)
data_full <- rbind(dat,data_full)

## 2018-19 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2018-19")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df %>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2018-19") %>%
  slice_head(n=13)
data_full <- rbind(dat,data_full)

## 2019-20 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2019-20")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df %>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2019-20") %>%
  slice_head(n=14)
data_full <- rbind(dat,data_full)

## 2021-22 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2021-22")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_oppStats <- read_html(source) %>%
  html_nodes("#game-opponents") %>%
  html_table()

df <- as.data.frame(list_oppStats[[1]])
# names(df) <- as.matrix(df[1, ])
dat <- df %>%
  clean_names() %>%
  # select(-c(bio_link, na)) %>%
  mutate(season = "2021-22") %>%
  slice_head(n=17)
data_full <- rbind(dat,data_full)

#specify types
data_full <- data_full %>%
  mutate(date = lubridate::mdy(date))


#fix date column -- error in 01/04/17 game to say 01/04/07
data_full[59, "date"] <- lubridate::mdy("01/04/2017")


#fix player names col
#data_full <- data_full %>%
  #mutate(player = sapply(str_split(player, "  "), "[[", 1))

#fix player names col try 2 - remove extra "\r\n" at end of strings in player col
#data_full <- data_full |>
  #mutate(player = gsub("[\r\n]", "", player))

write.csv(data_full, "data-raw/smith_oppwbb_data.csv", row.names= FALSE)

