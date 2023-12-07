library(ggplot2)
install.packages("dplyr")
library(dplyr)

dataset <- read.csv("/cloud/project/question-5-data/Cui_etal2014.csv")
#plotting data 
ggplot(aes(Genome.length..kb.,Virion.volume..nm.nm.nm.),
       data = dataset) + 
  geom_point() +
  theme_bw()
#that looks odd

#plotting the semilog 
ggplot(aes(Genome.length..kb.,Virion.volume..nm.nm.nm.),
       data = dataset) + 
  geom_point() +
  scale_y_continuous(trans='log10') +
  theme_bw()
# still not quite right

#plotting the semilog in x axis
ggplot(aes(Genome.length..kb.,Virion.volume..nm.nm.nm.),
       data = dataset) + 
  geom_point() +
  scale_x_continuous(trans='log10') +
  theme_bw()
#better?

#plotting with transformed x and y
ggplot(aes(Genome.length..kb.,Virion.volume..nm.nm.nm.),
       data = dataset) + 
  geom_point() +
  xlab("log[Genome length (kb)]") + ylab("log[Virion volume (nm3)]") +
  scale_y_continuous(trans='log10') +
  scale_x_continuous(trans='log10') +
  theme_bw()
#not sure...

#gonna pick the double log here for the model

#time to fit the model 
data_subset1 <- dataset %>% mutate(G_log = log(Genome.length..kb.) ) %>% filter(G_log >100) %>% 
  mutate(V_log = log(Virion.volume..nm.nm.nm.))

model1 <- lm(V_log ~ Genome.length..kb. , data_subset1)
summary(model1) #this returned with 11.37312, p< 2e-16


data_subset2 <- dataset %>%  mutate(V_log = log(Virion.volume..nm.nm.nm.)) %>% filter(V_log>100)

model2 <- lm(G_log ~ 1, data_subset2)
summary(model2) #returned a value of 5424800, p = 0.233


## reproducing the figure:

ggplot(aes(Genome.length..kb.,Virion.volume..nm.nm.nm.),
       data = dataset) + 
  geom_point() +
  xlab("log[Genome length (kb)]") + ylab("log[Virion volume (nm3)]") +
  scale_y_continuous(trans='log10') +
  scale_x_continuous(trans='log10') +
  theme_bw()
