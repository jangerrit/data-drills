# Libraries
library(readr)
library(dplyr)

# Data
survey <- read_csv("./final-form/employee_satisfaction_survey.csv", col_types = "Tci")

# Objective
survey |>
  group_by(Email) |>
  arrange(Email, desc(Timestamp)) |>
  slice(1L) |>
  group_by(Satisfaction) |>
  count(name = "Employees")
