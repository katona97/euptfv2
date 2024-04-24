library(ranger)
library(parallel)
library(repmis)
library (readr)


# load data with predictors -> now it is a sample dataset
new_data <- read_csv2("help/Ajka.csv")

# check available predictors in your dataset
names(new_data)


# find which PTFs are recommended for given set of available predictors
list_PTFs <- read_csv2("suggested_PTFs/list_of_final_PTFs.csv")
View(list_PTFs)
# available predictors in "new_data": USSAND USSILT USCLAY DEPTH_M OC BD CACO3 PH_H2O CEC
# row 32 includes recommended PTFs


### a) predict response without uncertainty ----
## prediction of field capacity (FC) with PTF07

# load prediction algorithm
load("suggested_PTFs/FC_EUHYDI/FC_PTF02.rdata")
FC <- predict(FC_PTF02,
              data=new_data,
              type = "response",
              num.threads = detectCores()-1)
FC <- FC$predictions

# add predicted values to the input dataset
new_data_pred2 <- cbind(new_data, FC)

## Compare
cbind(new_data_pred$FC, new_data_pred2$FC)
