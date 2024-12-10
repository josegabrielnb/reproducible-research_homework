library(janitor)
library(dplyr)
library(ggplot2)


Viral_volume_df <- read.csv("question-5-data/Cui_etal2014.csv")

##5a

Number_columns <- ncol(Viral_volume_df)
Number_rows <- nrow(Viral_volume_df)

Number_columns
Number_rows
#

##5b

Log_viral_volume_df <- Viral_volume_df %>%
  mutate(log_Volume = log(Virion.volume..nm.nm.nm.)) %>%
  mutate(log_Length = log(Genome.length..kb.))

model1 <- lm(log_Volume ~ log_Length, Log_viral_volume_df)

summary(model1)

#The value matches the allometric exponent provided in the paper for double stranded DNA.

##5d

ggplot(Log_viral_volume_df, aes(x = log_Length, y = log_Volume)) +
  geom_point() + 
  geom_smooth(method = "lm", linewidth = 0.8) +
  labs(y = "log[Virion volume (nm3)]", x = "log[Genome length (kb)]") +
  theme_bw() +
  theme(axis.title = element_text(face = "bold"))

##5e
  
#using the estimated parameters generated earlier we define the intercept and slope

# intercept
log_A <- 7.0748 

#Slope
B <- 1.5152       

# Define the genome length (L) in kb
L <- 300

# Calculate log(L)
log_L <- log(L)

# Use the model equation to calculate log(V)
log_V <- log_A + B * log_L

# Convert log(V) to V
V <- exp(log_V)

V

