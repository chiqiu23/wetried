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
# paths_allowed("https://smithpioneers.com/sports/womens-basketball/stats/2010-11") #TRUE , all good

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

# Get individualStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2010-11") %>%
  slice_head(n=12)
data_full <- dat

## 2011-12 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2011-12")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2011-12") %>%
  slice_head(n=13)
data_full <- rbind(dat,data_full)

## 2012-13 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2012-13")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2012-13") %>%
  slice_head(n=12)
data_full <- rbind(dat,data_full)

## 2013-14 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2013-14")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2013-14") %>%
  slice_head(n=11)
data_full <- rbind(dat,data_full)

## 2014-15 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2014-15")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2014-15") %>%
  slice_head(n=14)
data_full <- rbind(dat,data_full)

## 2015-16 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2015-16")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2015-16") %>%
  slice_head(n=18)
data_full <- rbind(dat,data_full)

## 2016-17 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2016-17")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2016-17") %>%
  slice_head(n=15)
data_full <- rbind(dat,data_full)

## 2017-18 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2017-18")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2017-18") %>%
  slice_head(n=14)
data_full <- rbind(dat,data_full)

## 2018-19 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2018-19")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2018-19") %>%
  slice_head(n=13)
data_full <- rbind(dat,data_full)

## 2019-20 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2019-20")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2019-20") %>%
  slice_head(n=14)
data_full <- rbind(dat,data_full)

## 2021-22 SEASON
remDr$navigate("https://smithpioneers.com/sports/womens-basketball/stats/2021-22")
# Read page source
source <- remDr$getPageSource()[[1]]

# Get topStats
list_idvStats <- read_html(source) %>%
  html_nodes("#individual") %>%
  html_table()

df <- as.data.frame(list_idvStats[[1]])
names(df) <- as.matrix(df[1, ])
dat <- df[-1, ] %>%
  clean_names() %>%
  select(-c(bio_link, na)) %>%
  mutate(season = "2021-22") %>%
  slice_head(n=17)
data_full <- rbind(dat,data_full)

#fix player names col
data_full <- data_full %>%
  mutate(player = sapply(str_split(player, "  "), "[[", 1))

#fix player names col try 2 - remove extra "\r\n" at end of strings in player col
data_full <- data_full |>
  mutate(player = gsub("[\r\n]", "", player))

#set number and stat cols to numeric (number, gp, gs, tot, avg, fgm, fga, fg_percent, x3pt, x3pta, x3pt_percent,
# ftm, fta, ft_percent, pts, avg_2, off, def, tot_2, avg_3, pf, ast, to, stl, blk)
data_full <- data_full |>
  mutate(number = as.numeric(number),
         gp = as.numeric(gp),
         gs = as.numeric(gs),
         tot = as.numeric(tot),
         avg = as.numeric(avg),
         fgm = as.numeric(fgm),
         fga = as.numeric(fga),
         fg_percent = as.numeric(fg_percent),
         x3pt = as.numeric(x3pt),
         x3pta = as.numeric(x3pta),
         x3pt_percent = as.numeric(x3pt_percent),
         ftm = as.numeric(ftm),
         fta = as.numeric(fta),
         ft_percent = as.numeric(ft_percent),
         pts = as.numeric(pts),
         avg_2 = as.numeric(avg_2),
         off = as.numeric(off),
         def = as.numeric(def),
         tot_2 = as.numeric(tot_2),
         avg_3 = as.numeric(avg_3),
         pf = as.numeric(pf),
         ast = as.numeric(ast),
         to = as.numeric(to),
         stl = as.numeric(stl),
         blk = as.numeric(blk))
write.csv(data_full, "data-raw/smith_wbb_data.csv", row.names= FALSE)

