# Load necessary library
library(ggplot2)

# Create a data frame with different means and standard deviations
mean_values <- c(0, 0)
sd_values <- c(1, 3)

# Create a sequence of x values
x <- seq(-10, 10, length.out = 1000)

# Create a data frame for plotting
data <- data.frame(x = rep(x, times = length(mean_values)),
                   mean = factor(rep(mean_values, each = length(x))),
                   sd = rep(sd_values, each = length(x)),
                   density = unlist(lapply(1:length(mean_values), function(i) {
                     dnorm(x, mean = mean_values[i], sd = sd_values[i])
                   })))

# Plot with ggplot and custom x-axis ticks
ggplot(data, aes(x = x, y = density, color = paste("Mean =", mean, ", SD =", sd))) +
  geom_line(size = 1) +
  labs(title = "Normal Distributions with Varying Means and Standard Deviations",
       x = "x",
       y = "Density",
       color = "Distributions") +
  scale_x_continuous(breaks = seq(-10, 10, by = 1)) +  # Add more ticks to the x-axis
  theme_minimal()
