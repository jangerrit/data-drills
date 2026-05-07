# Libraries
library("tidyverse")

# Data
streaks <- read_csv("~/Documents/GitHub/data-drills/Streak Leaderboard/LessonStreaks.csv")

# Objective
leaderboard <- streaks |>
  # Remove duplicate rows for multiple lessons on a single day
  distinct(user_id, date, .keep_all = TRUE) |>
  arrange(user_id, date) |>
  mutate(
    # Calculate when a streak is broken
    streak_break = replace_na(date - lag(date) > days(1), FALSE),
    # Create an id for each streak
    streak = cumsum(streak_break)
  ) |>
  group_by(user_id, user_name, streak) |>
  summarise(
    days = n(),
    start = min(date),
    end = max(date),
    .groups = "drop"
  ) |>
  filter(end == "2025-09-28") |>
  arrange(desc(days)) |>
  select(Name = user_name, Streak = days) |>
  slice_head(n = 10)

# Check
slice(leaderboard, 3L)
