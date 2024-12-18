###Script for question 5###

install.packages("ggplot2")
library(ggplot2)

#Importing data for dsDNA viruses
virus_data <- read.csv("question-5-data/Cui_etal2014.csv")
virus_data

#How many rows and columns does the table have?
nrow(virus_data) #33 rows
ncol(virus_data) #13 columns

#A Log transformation should be applied to fit a linear model to the data. This 
#is applied to both virion volume and genome length

#V=αL^β
#ln(V)=ln(α)+βln(L)

#Applying the log transformation:
virus_data$Log.virion.volume <- log(virus_data$Virion.volume..nm.nm.nm.)
virus_data$Log.genome.length <- log(virus_data$Genome.length..kb.)

virus_model <- lm(Log.virion.volume ~ Log.genome.length, virus_data)
summary(virus_model)

#The exponent (β) is 1.5152 (the slope of the line)

#ln(α) = 7.0748 
exp(7.07480) # = 1181.807
##Therefore the scaling factor (α) is: 1181.807

#The p-values from the model:
#For the intercept: 2.28e-10 ***
#For Log.genome.length: 6.44e-10 ***

#Both are statistically significant 


# A scatter plot showing the relationship between genome length and virion volume 
ggplot(virus_data, aes(Log.genome.length, Log.virion.volume)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  theme_bw() +
  labs(y = "log [Virion volume (nm3)]", x = "log [Genome length (kb)]") +
  theme(
    axis.title.x = element_text(face="bold"),
    axis.title.y = element_text(face="bold"), 
  )

# What is the estimated volume of a 300 kb dsDNA virus?

#V=αL^β
## α = 1181.807
## L = 300
## β = 1.5152

virus_vol_fun <- function(α,L,β) {
  V <- (α*L^β)
  return(V)
}

virus_vol_fun(1181.807,300,1.5152) #6,697,006