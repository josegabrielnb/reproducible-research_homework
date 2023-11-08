#install.packages("ggplot2")
#install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

random_walk  <- function (n_steps,seed) {
  
  set.seed(seed)
  
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  
  df[1,] <- c(0,0,1)
  
  for (i in 2:n_steps) {
    
    h <- 0.25
    
    angle <- runif(1, min = 0, max = 2*pi)
    
    df[i,1] <- df[i-1,1] + cos(angle)*h
    
    df[i,2] <- df[i-1,2] + sin(angle)*h
    
    df[i,3] <- i
    
  }
  
  return(df)
  
}


##Brownian motion is random but we need it to be reproducible
data1<-random_walk(1000,2)# The second input acts as a reproducible seed. In this case I have set it to be RESET every time so each seed here corresponds with ONE random graph.
ggplot(aes(x = x, y = y), data = data1) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

#data1 <- random_walk(500)

#plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  
#  geom_path(aes(colour = time)) +
  
#  theme_bw() +
  
#  xlab("x-coordinate") +
  
#  ylab("y-coordinate")

#data2 <- random_walk(500)

#plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  
#  geom_path(aes(colour = time)) +
  
#  theme_bw() +
  
#  xlab("x-coordinate") +
  
#  ylab("y-coordinate")

#grid.arrange(plot1, plot2, ncol=2)



