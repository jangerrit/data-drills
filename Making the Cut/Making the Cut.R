# Libraries
library(readr)
library(dplyr)
library(lubridate)
library(forcats)
library(formattable)

# Data
marathon <- read_csv("./Making the Cut/marathon-data.csv", col_types = "iftt")

# Objective
summary <- marathon |>
  mutate(
    finish_band = factor(
      case_when(
        final <= hm("03:00") ~ "Sub 3:00",
        final <= hm("03:30") ~ "3:00 - 3:30",
        final <= hm("04:00") ~ "3:30 - 4:00",
        final <= hm("04:30") ~ "4:00 - 4:30",
        final <= hm("05:00") ~ "4:30 - 5:00",
        final <= hm("05:30") ~ "5:00 - 5:30",
        final <= hm("06:00") ~ "5:30 - 6:00",
        .default = "6:00+"
      )
    ),
    # Reorder the factor level of the first, alphabetic finish band to make sure it is listed first
    finish_band = fct_relevel(finish_band, "Sub 3:00")
  ) |>
  count(finish_band, name = "runners" ) |>
  mutate(perc_of_field = percent(runners / sum(runners), digits = 1))

# Check
summary |>
  filter(finish_band == "Sub 3:00")
