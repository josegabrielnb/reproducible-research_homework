
#install.packages("ggplot2")
#install.packages("gridExtra")
library(ggplot2)
library(gridExtra)

# Function to generate reproducible Brownian motion
brownian_motion <- function(n_steps, seed) {
  set.seed(seed)  # Set seed for reproducibility
  
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
  df[1,] <- c(0, 0, 1)
  
  for (i in 2:n_steps) {
    h <- 0.25
    angle <- runif(1, min = 0, max = 2 * pi)
    
    df[i,1] <- df[i-1,1] + cos(angle) * h
    df[i,2] <- df[i-1,2] + sin(angle) * h
    df[i,3] <- i
  }
  
  return(df)
}

# Set seed for reproducibility
set.seed(123)

# Generate data for the first plot
data1 <- brownian_motion(500, seed = 123)

# Create the first plot
plot1 <- ggplot(aes(x = x, y = y), data = data1) +
  geom_path(aes(colour = time)) +
  theme_bw() +
  xlab("x-coordinate") +
  ylab("y-coordinate") +
  ggtitle("Brownian Motion 1")

# Generate data for the second plot
data2 <- brownian_motion(500, seed = 456)

# Create the second plot
plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  geom_path(aes(colour = time)) +
  theme_bw() +
  xlab("x-coordinate") +
  ylab("y-coordinate") +
  ggtitle("Brownian Motion 2")

# Arrange the plots side by side
grid.arrange(plot1, plot2, ncol = 2)

  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

grid.arrange(plot1, plot2, ncol=2)
