# Full Assembly

[Source] https://mavenanalytics.io/data-drills/full-assembly

# Objective

Your dataset contains order records for six bicycle models, along with a bill of materials describing how each model breaks down into subassemblies, and how those subassemblies break down further.

Your task is to calculate the total quantity of each individual part required to fulfill all orders in the dataset.

- Only count parts at the very bottom of the structure, not intermediate subassemblies.
- Some parts appear in more than one place in the structure; make sure every occurrence is counted.

# Control question

How many M5x20 Hex Bolts are needed in total to fulfill every order in the dataset?

# Correct answer

59642
