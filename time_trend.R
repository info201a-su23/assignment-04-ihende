library(ggplot2)
prison_population <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")

ggplot(prison_population, aes(x = year)) +
  geom_line(aes(y = black_prison_pop, color = "Black")) +
  geom_line(aes(y = white_prison_pop, color = "White")) +
  labs(title = "Growth of Prison Population by Race", x = "Year", y = "Prison Population", color = "Race")
