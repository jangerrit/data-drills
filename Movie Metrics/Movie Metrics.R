# Libraries
library(readr)
library(dplyr)

# Data
path <- "~/Documents/GitHub/data-drills/Movie Metrics/"
users <- read_csv(str_c(path, "users.csv"))
# Read binary `finished` column as logical
activity <- read_csv(str_c(path, "activity.csv"), col_types = "iiDcl")

# Objective
users_activity <- users |>
  rename(user_id = id) |>
  left_join(activity, by = join_by(user_id)) |>
  arrange(user_id, id) |>
  group_by(user_id) |>
  # Add a column with the number of movies started
  mutate(started_movies = n()) |>
  # Filter data and regroup to summarise the details of first/last finished movies
  filter(finished) |>
  group_by(user_id, started_movies) |>
  summarise(
    finished_movies = n(),
    first_finished_movie_date = first(date),
    first_finished_movie_name = first(movie_name),
    last_finished_movie_date = last(date),
    last_finished_movie_name = last(movie_name)
  )

# Check
users_activity |>
  filter(last_finished_movie_name == "Fight Club")
