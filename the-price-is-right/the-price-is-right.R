# Libraries
library(readr)
library(dplyr)
library(stringr)

# Data
transactions <- read_csv("./The Price is Right/transactions.csv", col_types = "iiDfi")
price_history <- read_csv("./The Price is Right/price_history.csv", col_types = "fDd")

# Objective
prices <- transactions |>
  left_join(
    price_history,
    join_by(
      pizza_id,
      closest(order_date >= effective_date)
    )
  )

# Check
prices |>
  summarise(revenue = round(sum(price * quantity)))
