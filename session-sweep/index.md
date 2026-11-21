# Session Sweep

[Source](https://mavenanalytics.io/data-drills/session-sweep)


# Objective

Your dataset contains ~40,000 timestamped pageview events across ~1,500 users on an e-commerce site.

Your task is to group these events into user sessions by assigning a session identifier to each pageview.

- A user’s first event begins a new session
- Any event that occurs more than 30 minutes after the user’s previous event begins a new session
- All other events belong to the user’s current session


# Control question

How many users had more than 1 session?

# Correct answer

1359
