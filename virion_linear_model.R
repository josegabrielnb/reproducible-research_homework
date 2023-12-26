library(dplyr)
virion_data <- read.csv(file.choose())
virion_data
log_transformed_data <- virion_data %>%
  mutate(log_V = log(`Virion.volume..nm.nm.nm.`),
         log_L = log(`Genome.length..kb.`))


linear_model <- lm(log_V ~ log_L, data = log_transformed_data)
summary(linear_model)
