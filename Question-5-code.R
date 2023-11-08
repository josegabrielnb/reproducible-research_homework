library(ggplot2)

Virus_data<-read.csv("question-5-data/Cui_etal2014.csv")
nrow(Virus_data)
ncol(Virus_data)

#if the data follows V=BL^a
#To linearise we need to 
ggplot(aes(Genome.length..kb. , Virion.volume..nm.nm.nm.),data=Virus_data)+
  geom_point()+
  scale_x_continuous(trans="log")+
  scale_y_continuous(trans="log")

model1<-lm(log(Virion.volume..nm.nm.nm.) ~ log(Genome.length..kb.), Virus_data)
summary(model1)
#Intercept is is 7.0748 with p value of 2.28e-10
#Gradient is  1.5152 with p Value of 6.44e-10

ggplot( aes(log(Genome.length..kb.),log(Virion.volume..nm.nm.nm.)) ,data=Virus_data)+
  geom_point()+
  theme_bw()+
  stat_smooth(method = "lm")+
  xlab("Log[Genome length (kb)]")+
  ylab("Log[Virion volume (nm3)]")
