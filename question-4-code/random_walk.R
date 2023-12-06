#install the required packages
install.packages("ggplot2")
install.packages("gridExtra")

#load the required packages into the envrionment
library(ggplot2)
library(gridExtra)

#create a function which simulates a random walk, each step is 0.25 long ands at a random angle 
random_walk  <- function (n_steps) {
  #create a data frame with columns x, y and time 
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  #set the initial position at (0,0) and time to 1 
  df[1,] <- c(0,0,1)
  #Perform the random walk 
  for (i in 2:n_steps) {
    #Define the step size 
    h <- 0.25
    #Generate a random angle between 0 and 2*pi
    angle <- runif(1, min = 0, max = 2*pi)
    #Update the x and y coordinates based on the random angle and step size 
    df[i,1] <- df[i-1,1] + cos(angle)*h
    
    df[i,2] <- df[i-1,2] + sin(angle)*h
    #Update the time 
    df[i,3] <- i
    
  }
  #return the data frame 
  return(df)
  
}

#creates a datset with 500 random walks 
data1 <- random_walk(500)

#plots the random walks 
plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

#creates a second data set with 500 walks 
data2 <- random_walk(500)

#plots the second data set 
plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

grid.arrange(plot1, plot2, ncol=2)

