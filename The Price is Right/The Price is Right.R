# Libraries
library("tidyverse")

# Data
path <- "~/Documents/GitHub/data-drills/The Price is Right/"
transactions <- read_csv(str_c(path, "transactions.csv"))
price_history <- read_csv(str_c(path, "price_history.csv"))

# Objective
prices <- transactions |>
  left_join(price_history, join_by(
    pizza_id, closest(order_date >= effective_date))
  )

# Check
prices |>
  mutate(revenue = price * quantity) |>
  summarise(
    orders = n_distinct(order_id),
    transactions = n(),
    price = round(mean(price), digits = 2),
    quantity = sum(quantity),
    revenue = round(sum(revenue), digits = 0)
  )
