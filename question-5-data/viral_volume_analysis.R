#install and load necessary packages
install.packages("ggplot2")
library(ggplot2)

#load the data
viral_data <- read.csv("question-5-data/Cui_etal2014.csv")
head(viral_data)

#exploratory plot of the data
ggplot(aes(Genome.length..kb.,Virion.volume..nm.nm.nm.), data = viral_data) +
  
  geom_point() +
  
  xlab("Genome length") +
  
  ylab("Virion volume") +
  
  theme_bw()

#apply the transformation
log_volume <- log(Virion.volume..nm.nm.nm.)
log_genome_length <- log(Genome.length..kb.)

#using a linear model to find α and β
model1 <- lm(log(Virion.volume..nm.nm.nm.) ~ log(Genome.length..kb.), viral_data)
summary(model1)

#output of summary:
#lnβ is the intercept and α is the gradient
#intercept estimate = lnβ = 7.0748, so β = exp(7.0748) = 1,181.807; p-value 2.28e-10
#gradient estimate = α = 1.5152; p-value 6.44e-10
exp(7.0748)

#recreate the graph shown in the assignment
#plot log genome length vs. log virion volume; with a regression line
ggplot(aes(log(Genome.length..kb.),log(Virion.volume..nm.nm.nm.)), data = viral_data)+
  geom_smooth(method = "lm")+
  geom_point()+
  labs(x="log[Genome length (kb)]", y="log [Virion volume (nm3)]")+
  theme_bw()

#find the estimated volume of a 300kb dsDNA virus
volume_of_interest <- function(length) {
  V <- β*((length)^α)
  return(V)
} 

α <- 1.5152
β <- exp(7.0748)

volume_of_interest(300)
