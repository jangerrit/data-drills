# Packages
library(readr)
library(dplyr)
library(tidyr)
library(lubridate)

# Data
sessions <- read_csv("./session-sweep/web_clickstream.csv", col_types = "iiTc")

# Objective
sessions |>
  arrange(user_id, timestamp) |>
  group_by(user_id) |>
  mutate(
    session_start = if_else(
      row_number() == 1 | timestamp > lag(timestamp) + minutes(30),
      timestamp,
      NA
    )
  ) |>
  fill(session_start) |>
  summarise(sessions = n_distinct(session_start)) |>
  filter(sessions > 1)
