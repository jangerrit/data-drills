# Libraries
library(readr)
library(dplyr)
library(stringr)

# Data
path <- "~/Documents/GitHub/data-drills/The Price is Right/"
transactions <- read_csv(str_c(path, "transactions.csv"), col_types = "iiDfi")
price_history <- read_csv(str_c(path, "price_history.csv"), col_types = "fDd")

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
