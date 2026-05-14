# Libraries
library(readr)
library(dplyr)
library(lubridate)
library(formattable)

# Data
bookings <- read_csv("~/Documents/GitHub/data-drills/Booking Breakdown/hotel_bookings.csv", col_types = "iDDDDl")
capacity <- 200

# Objective
occupancy <- bookings |>
  filter_out(is_canceled) |>
  right_join(
    tibble(
      date = seq(
        min(bookings$checkin_date),
        max(bookings$checkout_date)
      )
    ),
    join_by(
      checkin_date <= date,
      checkout_date > date
    )
  ) |>
  group_by(
    Year = year(date),
    Month = month(date, label = TRUE, abbr = TRUE)
  ) |>
  summarise(
    Occupations = n(),
    Capacity = n_distinct(date) * capacity,
    Occupancy = percent(Occupations / Capacity, digits = 1),
  )

# Check
filter(occupancy, Year == 2016, Month == "Jul")
