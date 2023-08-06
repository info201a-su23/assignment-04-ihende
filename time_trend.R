library(ggplot2)
prison_population <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")
prison_rate <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true")

filtered_prison_population <- na.omit(prison_population)

ggplot(filtered_prison_population, aes(x = year)) +
  geom_line(aes(y = black_prison_pop, color = "Black")) +
  geom_line(aes(y = white_prison_pop, color = "White")) +
  labs(title = "Growth of Black vs. White Prison Population Over Time", x = "Year", y = "Prison Population", color = "Race")

