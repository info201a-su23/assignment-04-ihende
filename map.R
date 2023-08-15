library(ggplot2)
library(dplyr)
library(maps)
library(scales)
library(tidyverse)

prison_pop <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")
prison_rate <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates.csv")

black_prison_rate_2010 <- prison_rate %>%
  filter(year == 2010) %>%
  group_by(state) %>%
  summarize(states_black_prison_pop_rate = mean(black_prison_pop_rate, na.rm = TRUE))

us_map <- map_data("state")
us_map$region <- toupper(str_sub(us_map$region, 1, 2))
map_black_prison_pop_rate <- left_join(us_map, black_prison_rate_2010,
                            by = c("region" = "state"))

blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(), 
    axis.text = element_blank(), 
    axis.ticks = element_blank(), 
    axis.title = element_blank(),
    plot.background = element_blank(), 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(), 
    panel.border = element_blank(), 
  )

data_map <- ggplot(data = map_black_prison_pop_rate, aes(x = long, 
                                  y = lat, 
                                  group = group, 
                                  fill = states_black_prison_pop_rate)) +
  geom_polygon(color = "black") +
  scale_fill_gradient(name = "Avg. Prison Population Rate", low = "lavender", high = "darkblue") +
  labs(title = "Average Black Prison Population per 100,00 People (Rate) by State (2010)") +
  coord_map() +
  blank_theme

print(data_map)
