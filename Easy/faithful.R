# Install and load required packages
if (!require("dirichletprocess")) {
  install.packages("dirichletprocess")
}
if (!require("ggplot2")) {
  install.packages("ggplot2")
}

library(dirichletprocess)
library(ggplot2)

# Load the faithful dataset
data("faithful")

# Extract the waiting time between consecutive eruptions
waiting_time <- faithful$waiting

# Fit the Dirichlet process Gaussian mixture model
dp <- DirichletProcessGaussian(waiting_time)
dp <- Fit(dp, its = 1000)

plot(dp)
