# Libraries
library(readr)
library(dplyr)

# Data
campaigns <- read_csv("./common-denominator/campaign_performance.csv", col_types = "ccnn")

# Objective
campaigns |>
  group_by(channel) |>
  summarise(
    ctr = weighted.mean(ctr, impressions),
    impressions = sum(impressions)
  ) %>%
  bind_rows(
    summarise(
      .,
      channel = "Total",
      ctr = weighted.mean(ctr, impressions),
      impressions = sum(impressions)
    )
)
