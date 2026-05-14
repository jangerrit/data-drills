# Libraries
library(readr)
library(dplyr)
library(jsonlite)

# Data
sales <- read_csv("~/Documents/GitHub/data-drills/Flatten the Stack/sales_orders.csv")

# Objective
sales <- sales |>
  mutate(line_items = map(line_items, fromJSON, flatten = TRUE)) |>
  unnest(line_items) |>
  rename(
    product = product.product_name,
    price = product.product_price
  )

# Control question
sales |>
  filter(fulfillment == "Online") |>
  summarise(sales = round(sum(quantity * price)))
