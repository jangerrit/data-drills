# Libraries
library(readr)
library(dplyr)
library(tidyr)
library(jsonlite)

# Data
sales <- read_csv("~/Documents/GitHub/data-drills/Flatten the Stack/sales_orders.csv", col_types = "dDcf")

# Objective
sales <- sales |>
  mutate(line_items = map(line_items, fromJSON, flatten = TRUE)) |>
  unnest(line_items) |>
  rename(
    product = product.product_name,
    price = product.product_price
  )

# Check
sales |>
  filter(fulfillment == "Online") |>
  summarise(sales = round(sum(quantity * price)))
