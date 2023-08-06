library(ggplot2)
library(dplyr)
library(scales)
library(maps)

prison_rate <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true", stringsAsFactors = FALSE) %>%
  filter(year == 2010) %>%
  mutate(state = tolower(state))

state_shape <- map_data("state") %>%
  rename(state = region)

prison_rate_state_shape <- left_join(state_shape, prison_rate, by = "state")

blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(),      
    axis.text = element_blank(),      
    axis.ticks = element_blank(),      
    axis.title = element_blank(),       
    plot.background = element_blank(),  
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(), 
    panel.border = element_blank()      
  )

black_prison_rates_map <- ggplot(data = prison_rate_state_shape) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = black_prison_pop_rate)) +
  scale_fill_continuous(low = "grey", high = "red") +
  labs(title = "Black Prison Rates in the USA (2010)", fill = "Prison Rate") + 
  coord_map() +
  blank_theme

black_prison_rates_map
