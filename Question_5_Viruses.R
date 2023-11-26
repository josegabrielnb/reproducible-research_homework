Cui_etal2014

install.packages("janitor")
library(janitor)

install.packages("tidyverse")
library(tidyverse)

install.packages("ggplot2")
library(ggplot2)

# clean data so that variables have clear, readable names 
cuietal2014 <- rename(Cui_etal2014, virion_volume = "Virion volume (nm×nm×nm)", genome_length = "Genome length (kb)")
cuietal2014

# creating the log transformed data 
cuietal2014$log_virion_volume <- log(cuietal2014$virion_volume)
cuietal2014$log_genome_length <- log(cuietal2014$genome_length)
cuietal2014 
view(cuietal2014)

# performing a linear regression to transform the data- before transforming data 
# variables- virion_volume and genome_length
mod_1 <- lm(log_virion_volume ~ log_genome_length , cuietal2014)
summary(mod_1)
anova(mod_1)


# data needs to be log transformed
ggplot(mod_1, aes (x = log_genome_length, y = log_virion_volume)) +
  geom_point() +
  geom_smooth(method = "lm")+
  labs(x = "log [Genome length (kb)]", 
       y = "log [Virion volume (nm3)]") +
  theme_bw() +
  theme(axis.title.x = element_text(face = "bold"),
        axis.title.y = element_text(face = "bold"))

sink(file = "package-versions.txt")
sessionInfo()
sink()
