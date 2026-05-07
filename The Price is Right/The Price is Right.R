# Libraries
library("tidyverse")

# Data
path <- "~/Documents/GitHub/data-drills/The Price is Right/"
transactions <- read_csv(str_c(path, "transactions.csv"))
price_history <- read_csv(str_c(path, "price_history.csv"))

# Objective
prices <- left_join(
  transactions,
  price_history,
  join_by(
    pizza_id,
    closest(order_date >= effective_date)
  )
)

# Check
summarise(
  prices,
  revenue = round(sum(price * quantity))
)
