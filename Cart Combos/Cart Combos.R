# Libraries
library(readr)
library(dplyr)

# Data
transactions <- read_csv("./Cart Combos/grocery_transactions.csv", col_types = "iTiiccid")

# Objective
transaction_products <- transactions |>
  distinct(
    transaction_id,
    product_name
  )

# Objective
transaction_products |>
  inner_join(
    transaction_products,
    join_by(
      transaction_id,
      product_name < product_name
    )
  ) |>
  rename(
    first_product = product_name.x,
    second_product = product_name.y
  ) |>
  count(
    first_product,
    second_product,
    sort = TRUE,
    name = "transactions"
  ) |>
  slice_head(n = 5)
