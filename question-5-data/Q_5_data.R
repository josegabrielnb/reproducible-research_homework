# Question 5 script:
  
# Loading libraries
library(dplyr)  # data manipulation
library(readr)  # reading CSV files

# Specifying the working directory to location of .csv file
setwd("/cloud/project/question-5-data")

getwd()  

# Reading the .CSV file
Q5_Data <- read_csv("Cui_etal2014.csv")

##  Question 5)a

# Print and view the data 
print(head(Q5_Data))

View(Q5_Data)

# Checking the dimensions of the full data set
full_dim <- dim(Q5_Data)
print(full_dim)  # column number: 13, row number: 33

## Question 5) b
# Applying the log transformation

data_logged <- data %>% 
  mutate(log_volume = log(`Virion volume (nm×nm×nm)`), log_length = log(`Genome length (kb)`))

# Viewing the log-transformed data
print(head(data_logged))
full_dim_log <- dim(data_logged)
print(full_dim_log)

# saving transformed data to a .csv file
write_csv(data_logged, "Cui_etal2014_log_transformed.csv")

## Question 5) c: find exponent (B) and scaling factor (a) of allometric law for dsDNA viruses. 
# write down p-values from model obtained and state their statistical significance. compare to valus from table two of paper

# fitting the linear model
linear_logged_model <- lm(log_volume ~ log_length, data = data_logged)

# viewing coefficients of the linear model
summary(linear_logged_model)

## Question d) Generating the model

# Loading required library
library(ggplot2)

# using the linear model above:
linear_logged_model <- lm(log_volume ~ log_length, data = data_logged)

# Create the plot
ggplot(linear_logged_model, aes(x = log(log_length), y = log(log_volume))) +
  geom_point(color = "black") +  # colour of scatter points
  geom_smooth(method = "lm", se = TRUE, color = "blue") +  # coding the regression line and confidence interval
  labs(x = "log[Genome length (kb)]", y = "log[Virion volume (mm³)]") +  # lebelling axes
  theme_minimal()  # setting a theme 