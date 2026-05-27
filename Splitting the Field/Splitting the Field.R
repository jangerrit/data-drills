# Libraries
library(readr)
library(dplyr)
library(tidyr)

# Data
players <- read_csv("./Splitting the Field/baseball_positions.csv")

# Objective
positions <- players |>
  separate_longer_delim(cols = Position, delim = "/") |>
  group_by(Position) |>
  summarise(Players = n()) |>
  arrange(desc(Players))

# Check
positions |>
  slice(3L)
