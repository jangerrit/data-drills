# Libraries
library(readr)
library(dplyr)
library(formattable)

# Data
admissions <- read_csv("./readmission-radar/inpatient_admissions.csv", col_types = "ccDD")

# Objective
admissions |>
  group_by(patient_id) |>
  mutate(readmission = if_else(
    admission_date - lag(discharge_date) <= 30, 1, 0, missing = 0
  )) |>
  ungroup() |>
  summarise(readmission_rate = percent(mean(readmission)))
