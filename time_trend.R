library(ggplot2)
library(dplyr)

prison_rate <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-jail-rates.csv")

prison_rate_states <- prison_rate %>% 
  na.omit() %>%
  group_by(year) %>%
  summarize(black_prison_rate = mean(black_prison_pop_rate), 
            latinx_prison_rate = mean(latinx_prison_pop_rate),
            white_prison_rate = mean(white_prison_pop_rate))

line_chart <- ggplot() + 
  geom_line(data = prison_rate_states, aes(x = year, 
                                           y = black_prison_rate, 
                                           color = "Black")) + 
  geom_line(data = prison_rate_states, aes(x = year, 
                                           y = latinx_prison_rate, 
                                           color = "Latinx")) +
  geom_line(data = prison_rate_states, aes(x = year, 
                                           y = white_prison_rate, 
                                           color = "White")) +
  labs(x = "Year", 
       y = "Population per 100,000 People (Rate)", 
       color = "Race",
       title = "Growth of Prison Population per 100,000 People by Race (1990-2018)") 

print(line_chart)
