library(ggplot2)

prison_population <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")
prison_rate <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true")

filter_year <- subset(prison_population, year == 2010)
filtered_prison_population <- na.omit(filter_year)

ggplot(filtered_prison_population, aes(x = black_prison_pop)) +
 geom_point(aes(y = white_prison_pop)) +
 labs(title = "Black vs. White Prison Population (2010)", x = "Black Prison Population", y = "White Prison Population")
