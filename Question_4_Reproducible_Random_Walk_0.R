# editing the script to make it reproducible 
# ensuring randomness but reproducibility- each graph should be randomly generated 
# but then should also be able to be replicated 

#install.packages("ggplot2")
#install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

random_walk  <- function (n_steps, seed = NULL) {
  if(!is.null(seed)) {
    set.seed(seed) # telling the function that the the seed value has to be set and not randomly
    # generated so that each plot generated begins from the same set point. 
  }
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

set.seed(10) # choose a random number
data1 <- random_walk(500)

plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  geom_path(aes(colour = time)) +
  theme_bw() +
  xlab("x-coordinate") +
  ylab("y-coordinate")
plot1

set.seed(36)
data2 <- random_walk(500)

plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  geom_path(aes(colour = time)) +
  theme_bw() +
  xlab("x-coordinate") +
  ylab("y-coordinate")
plot2

grid.arrange(plot1, plot2, ncol=2)

sink(file = "package-versions.txt")
sessionInfo()
sink()