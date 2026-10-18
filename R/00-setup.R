## 0. Projet Initial Setup
##
## Activate `renv` and install the required packages

# Initialize renv and install the packages logged in the `renv.lock` file
renv::init()

# restart R if it has not been done automatically

source("R/shared_variables.R", local = TRUE)

# This code installs the version of EpiModelHIV used for the paper
renv::install("EpiModel/EpiModelHIV@LowBarrier-JID")

# Snapshot the list of installed packages to the `renv.lock` file
renv::snapshot()

# Get the initial set of parameters from EpiModelHIV
fs::file_copy(
  system.file("model_parameters.csv", package = "EpiModelHIV"),
  fs::path(input_dir, "model_parameters.csv"),
  overwrite = TRUE
)

# # To install the packages from scratch:
# renv::install(c(
#     "EpiModel/EpiModelHIV@LowBarrier-JID",
#     "Epimodel/EpiModelHPC",
#     "readr", "RcppRoll", "viridis"
# ))
# # If you have access to ARTnetData:
# renv::install("Epimodel/ARTnetData")

# If you don't have access to ARTnetData, comment this line
if (FALSE) {
  library(ARTnetData)
}
