# Libraries
library(readr)
library(dplyr)
library(lubridate)
library(formattable)

# Data
subscriptions <- read_csv("./cohort-curve/streaming_subscriptions.csv", col_types = "iiDD")

# Objective
subscriptions |>
  filter(year(created_date) == 2025, month(created_date) == 11) |>
  mutate(
    months_renewed = interval(
      created_date,
      coalesce(canceled_date - 1, today())
    ) %/% months(1)
  ) |>
  count(months_renewed) |>
  mutate(
    churn = lag(cumsum(n), default = 0),
    retention = sum(n) - churn,
    retention_rate = percent(retention / sum(n), digits = 1L)
  ) |>
  select(months_renewed, retention_rate)
