# Libraries
library(readr)
library(dplyr)
library(stringr)
library(data.tree)

# Data
initech <- read_csv("./org-chart-overhaul/OfficeSpace.csv")

# Objective
initech <- initech |>
  # Replace NAs, as datatree cannot convert those into nodes
  mutate(`Manager Name` = replace_na(`Manager Name`, "")) |>
  FromDataFrameNetwork() |>
  ToDataFrameNetwork("pathString", "count", "totalCount") |>
  mutate(
    `Employee Name` = to,
    `Manager Name` = from,
    `Reporting Hierarchy` = str_extract(pathString, "^/?(.*)/.+$", group = 1),
    `Direct Reports` = count,
    # Take away the current node from the Total Reports count
    `Total Reports` = totalCount - 1,
    across(where(is.character), ~ na_if(., ""))
  ) |>
  select(`Employee Name`:`Total Reports`)

# Check
sum(initech$`Total Reports`)
