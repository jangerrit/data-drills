# Readmission Radar

[Source](https://mavenanalytics.io/data-drills/readmission-radar)

# Objective

Your dataset contains 623 inpatient stay records from a small hospital. Each record represents a patient discharge, and includes the patient ID, admission date, and discharge date.

Your task is to calculate the hospital's 30 day readmission rate. 

Notes:

- A discharge counts as a 30-day readmission when the same patient is admitted again within 30 days of their discharge date
- Day 30 is included in the readmission window
- Assume that all records in the dataset have had a full 30-day follow-up window

# Control question

What is the hospital's 30-day readmission rate?  (digits only, rounded down to the nearest percentage point)

# Correct answer

37
