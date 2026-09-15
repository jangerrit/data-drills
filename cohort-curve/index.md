# Cohort Curve

[Source](https://mavenanalytics.io/data-drills/cohort-curve)


# Objective

Your dataset contains roughly 19,000 subscription records for a monthly streaming service, each with a customer ID, a signup date, and a cancellation date.

Your task is to group subscribers into cohorts by signup month and calculate each cohort’s retention rate after 1 month, 2 months, 3 months, and so on.

A few rules to keep in mind:

- Treat each subscription record independently. If a customer cancels and later resubscribes, each subscription belongs to the cohort associated with its own signup date.
- A subscription is only considered retained after N months if it remained active beyond the corresponding monthly renewal date. If the cancellation date falls exactly on that date, do not count it as retained.
- Subscriptions with no cancellation date should be treated as active through the latest applicable month in the analysis.

# Control question

What was the 3-month retention rate for the November 2025 cohort? (Round down to the nearest whole percentage point)

# Correct answer

30
