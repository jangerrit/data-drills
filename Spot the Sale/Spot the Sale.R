# Libraries
library(readr)
library(dplyr)

# Data
path <- "~/Documents/GitHub/data-drills/Spot the Sale/"
promotions <- read_csv(str_c(path, "promotions.csv"), col_types = "ffDD")
orders <- read_csv(str_c(path, "orders.csv"))

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
