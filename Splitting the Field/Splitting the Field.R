# Libraries
library(readr)
library(dplyr)

# Data
players <- read_csv("~/Documents/GitHub/data-drills/Splitting the Field/baseball_positions.csv")

# Objective
positions <- players |>
  separate_longer_delim(cols = Position, delim = "/") |>
  group_by(Position) |>
  summarise(Players = n()) |>
  arrange(desc(Players))

# Check
slice(positions, 3L)
