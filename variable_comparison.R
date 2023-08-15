library(ggplot2)

prison_rate <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates.csv")

filter_year <- subset(prison_rate, year == 2010)
filtered_prison_rate <- na.omit(filter_year)

scatter_plot <- ggplot(filtered_prison_rate, aes(x = black_prison_pop_rate)) +
 geom_point(aes(y = white_prison_pop_rate)) +
 labs(title = "Black vs. White Prison Population per 100,000 People (Rate) (2010)", 
      x = "Black Prison Population Rate", 
      y = "White Prison Population Rate")

print(scatter_plot)
