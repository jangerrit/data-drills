# Libraries
library(readr)
library(dplyr)
library(lubridate)

# Data
sales <- read_csv("./rolling-up-looking-back/coffee_shop_sales.csv", col_types = "iDfcid")

# Objective
monthly_sales <- sales |>
  mutate(
    year = year(date),
    month = month(date, label = TRUE, abbr = TRUE)
  ) |>
  group_by(store, year, month) |>
  summarise(sales = round(sum(sales))) |>
  mutate(change = sales - lag(sales))

# Check
monthly_sales |>
  filter(year == 2023, month == "May", store == "Astoria")
