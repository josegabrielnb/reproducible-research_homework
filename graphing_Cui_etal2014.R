#read in the Cui_etal2014 data 
Cui_etal2014 <- read.csv("question-5-data/Cui_etal2014.csv")

#install and laod packages 
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

#count the number of rows and columns in the data frame
nrow(Cui_etal2014)
ncol(Cui_etal2014)

#look at what columns we have 
names(Cui_etal2014)

#plot genome length against virion volume 
allometric_scaling_plot <- ggplot(data=Cui_etal2014, 
                                  aes(x=Genome.length..kb., 
                                      y=Virion.volume..nm.nm.nm.)) + 
  geom_point() + 
  labs(x="Genome Length (kb)", y="Virion Volume (nm3)")

allometric_scaling_plot

#add logaithmic scales to the x and y axis to transform it into a linear model 
allometric_scaling_plot_log <- ggplot(data=Cui_etal2014, 
                                  aes(x=Genome.length..kb., 
                                      y=Virion.volume..nm.nm.nm.)) + 
  geom_point() + 
  labs(x="Genome Length (kb)", y="Virion Volume (nm3)") + 
  scale_y_continuous(trans='log10') + 
  scale_x_continuous(trans='log10')

allometric_scaling_plot_log

##fit the linear model 
#add a new column to the data frame that is log(virion_volume) and log(genome_length)
data_with_logs<- Cui_etal2014 %>% mutate(virion_volume_log = log(Virion.volume..nm.nm.nm.), genome_length_log = log(Genome.length..kb.))
# Using the new data frame containing 
model1 <- lm(virion_volume_log ~ genome_length_log, data_with_logs)
summary(model1)

#alpha and beta values therefore are 
beta = e^7.0748 = 1181.81
alpha = 1.5152

#plot the graph for question five 
mimic_plot <- ggplot(data=data_with_logs, 
                                  aes(x=genome_length_log, 
                                      y=virion_volume_log)) + 
  geom_point() + 
  labs(x="log[Genome Length (kb)]", y="log[Virion Volume (nm3)]") + 
  geom_smooth(method="lm") +
  theme_bw() + 
  theme(axis.title.x = element_text(size = 13, face="bold"),
        axis.title.y = element_text(size = 13, face="bold"))

mimic_plot
