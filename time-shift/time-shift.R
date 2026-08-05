# Libraries
library(readr)
library(dplyr)
library(stringr)
library(lubridate)

# Data
tickets <- read_csv("./time-shift/tickets.csv", col_types = "iiT")
users <- read_csv("./time-shift/users.csv", col_types = "icc")

# Objective
tickets |>
  left_join(users, by = "user_id") |>
  mutate(
    offset = str_extract(timezone, "(?<=^GMT )[+-]\\d{2}"),
    hour = hour(submitted_at_utc + hours(offset))
  ) |>
  count(hour, sort = TRUE)
