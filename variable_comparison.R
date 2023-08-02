library(ggplot2)
prison_rate <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true")

filter_years <- subset(prison_rate, year >= 1990 & year <= 2010)

ggplot(filter_years, aes(x = year)) +
  geom_line(aes(y = total_prison_pop_rate)) +
  labs(title = "Total Prison Population Rates over Time", x = "Year", y = "Prison Population Rate")
