library(ranger)
library(parallel)
library(repmis)
library (readr)


# load data with predictors -> now it is a sample dataset
new_data <- read_csv2("help/Ajka.csv")

# check available predictors in your dataset
names(new_data)