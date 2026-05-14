# Libraries
library(readr)
library(dplyr)
library(data.table)

# Data
close_prices <- read_csv("~/Documents/GitHub/data-drills/Turning Bullish/SPY_close_price_5Y.csv")

# Objective
close_prices <- close_prices |>
  mutate(
    `50d` = frollmean(Close, 50),
    `200d` = frollmean(Close, 200),
    `Golden Cross` = if_else(lag(`50d`) <= lag(`200d`) & `50d` > `200d`, 1, 0)
  )

# Check
close_prices |>
  filter(`Golden Cross` == 1) |>
  last()
