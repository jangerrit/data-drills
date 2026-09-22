# Libraries
library(readr)
library(dplyr)
library(stringr)
library(data.tree)

# Data
orders <- read_csv("./full-assembly/bike_orders.csv", col_types = "iDfi")
bom <- read_csv("./full-assembly/bike_bom.csv", col_types = "ffi")

# Objective
library(readr)
library(dplyr)
library(stringr)
library(data.tree)

# Data
orders <- read_csv("./full-assembly/bike_orders.csv", col_types = "iDfi")
bom <- read_csv("./full-assembly/bike_bom.csv", col_types = "ffi")

# Objective
bike_models <- tibble(
  parent_item = "",
  child_item = levels(orders$bike_model),
  quantity_per = 1
)

parts <- bom |>
  bind_rows(bike_models) |>
  FromDataFrameNetwork() |>
  ToDataFrameNetwork("name", "level", "quantity_per") |>
  filter(level > 2) |>
  mutate(bike_model = str_extract(from, "^/([^/]+)", group = 1))

orders |>
  left_join(parts, join_by(bike_model)) |>
  group_by(name) |>
  summarise(total_quantity = sum(quantity * quantity_per)) |>
  filter(name == "M5x20 Hex Bolt")
