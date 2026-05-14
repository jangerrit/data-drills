# Libraries
library(readr)
library(dplyr)

# Data
sales <- read_csv("~/Documents/GitHub/data-drills/Estimate the Estate/manhattan_property_sales.csv")

# Objective
market_values <- sales |>
  rename_with(tolower) |>
  group_by(zip_code, building_class) |>
  mutate(
    # Replace 0 with NA to remove them from the window mean
    sale_price = na_if(sale_price, 0),
    market_value = replace_values(
      # Use any existing `sale_price`
      sale_price,
      # Calculate window mean sale_price per square_feet as an estimated value
      NA ~ round(mean(sale_price / square_feet, na.rm = TRUE), digits = 0) *
        square_feet
    )
  )

# Check
market_values |>
  filter(market_value > 15 * 10^6) |>
  glimpse()
