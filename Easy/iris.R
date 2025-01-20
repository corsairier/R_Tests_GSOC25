# install required packages
if (!require("dirichletprocess")) install.packages("dirichletprocess")
if (!require("dplyr")) install.packages("dplyr")
if(!require("ggplot2")) install.packages("ggplot2")
if(!require("GGally")) install.packages("GGally")

# import packages
library(dplyr)
library(dirichletprocess)
library(ggplot2)
library(GGally) 

# Fitting of Iris dataset into the Dirichlet Process Multivariate Normal
irisPred <- iris %>% select(-Species) %>% scale() 
dp <- DirichletProcessMvnormal(irisPred)
dp <- Fit(dp, 5000)

# Plotting Pairs plot
pairs(irisPred, col=dp$clusterLabels)


irisPred_df <- as.data.frame(irisPred)  # Convert scaled data to data frame
irisPred_df$Cluster <- as.factor(dp$clusterLabels)  # Add cluster labels

# Plot ggpairs plot for better visualization along with Pearson Correlation Coefficient
ggpairs(irisPred_df, aes(color = Cluster, alpha = 0.6)) +
  theme_minimal()
