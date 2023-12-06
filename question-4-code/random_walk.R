install.packages("ggplot2")
install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

#set the seed, to ensure reproducibility of the function
set.seed(8002)

#brownian_motion is a function of the number of steps
brownian_motion  <- function (n_steps) {
  
  #create a dataframe, containing x, y, and time.
  #x and y are filled with NA for however many steps are selected
  #time runs from 1 - *number of steps selected*
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  
  #define the first row of the dataset (the first step), which starts at x=0, y=0, at time = 1
  df[1,] <- c(0,0,1)
  
  #for every step:
  for (i in 2:n_steps) {
    
    #represents step size (0.25)
    h <- 0.25
    
    #generate a direction for the step, which is between 0-360 degrees (=2*pi)
    angle <- runif(1, min = 0, max = 2*pi)
    
    #the new x coordinate (the ith row) = the previous x coordinate + cos(angle selected) * the step length
    df[i,1] <- df[i-1,1] + cos(angle)*h
    
    #the new y coordinate (the ith row) = the previous y coordinate + sin(angle selected) * the step length
    df[i,2] <- df[i-1,2] + sin(angle)*h
    
    #the t value of the ith row = i
    df[i,3] <- i
    
  }
  
  #the product of the function is the dataframe 'df'
  return(df)
  
}

#run the brownian_motion funtion with 500 steps, and store the output in a variable called 'data1'
data1 <- brownian_motion(500)

#plot the output that is stored in 'data1'
plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  
  #colour represents time
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate") +
  
  labs(title="Plot 1") +
  
  xlim(c(-3, 4)) +
  ylim(c(2, -10))

#print the plot
plot1

#repeat the process for a different run of the brownian_motion function
set.seed(8002)
data2 <- brownian_motion(500)

plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate") +
  
  labs(title="Plot 2") +
  
  xlim(c(-3, 4)) +
  ylim(c(2, -10))

plot2

#show plot 1 and plot 2 next to each other
grid.arrange(plot1, plot2, ncol=2)

