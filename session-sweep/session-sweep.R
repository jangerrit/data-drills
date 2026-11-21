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
    new_session = replace_na(timestamp > lag(timestamp) + minutes(30), TRUE)
  ) |>
  count(new_session) |>
  filter(new_session == TRUE, n > 1)

