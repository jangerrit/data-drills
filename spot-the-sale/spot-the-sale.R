# Libraries
library(readr)
library(dplyr)

# Data
promotions <- read_csv("./Spot the Sale/promotions.csv", col_types = "ffDD")
orders <- read_csv("./Spot the Sale/orders.csv")

# Objective
orders <- orders |>
  left_join(
    promotions,
    join_by(between(order_date, start_date, end_date))
  ) |>
  select(order_id:promo_id)

# Check
orders |>
  filter(is.na(promo_id)) |>
  count()
