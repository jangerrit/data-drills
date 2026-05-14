# Libraries
library(readr)
library(dplyr)

# Data
sales <- read_csv("~/Documents/GitHub/data-drills/Rolling Up, Looking Back/coffee_shop_sales.csv")

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
filter(monthly_sales, year == 2023, month == "May", store == "Astoria") |>
  pull(change)
