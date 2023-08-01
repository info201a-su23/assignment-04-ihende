library(tidyverse)
library(dplyr)
library(ggplot2)

## Introduction and Summary
prison_population <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true")
View(prison_population)
prison_rate <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-jail-rates.csv?raw=true")
View(prison_rate)

# Difference in average White vs. Black total prison population in 2010
white_prison_2010 <- prison_population %>%
  filter(year == 2010) %>%
  summarize(total_white_prison_pop = sum(white_prison_pop, na.rm = TRUE))

black_prison_2010 <- prison_population %>%
  filter(year == 2010) %>%
  summarize(total_black_prison_pop = sum(black_prison_pop, na.rm = TRUE))

print(black_prison_2010 - white_prison_2010)

# Mean of white prison population rate in 1990
mean_white_pop_rate_1990 <- prison_rate %>%
  filter(year == 1990) %>%
  summarize(mean_white_prison_pop_rate = mean(white_prison_pop_rate, na.rm = TRUE))
print(mean_white_pop_rate_1990)

# Mean of black prison population rate in 1990
mean_black_pop_rate_1990 <- prison_rate %>%
  filter(year == 1990) %>%
  summarize(mean_black_prison_pop_rate = mean(black_prison_pop_rate, na.rm = TRUE))
print(mean_black_pop_rate_1990)

# Mean of white prison population rate in 2010
mean_white_pop_rate_2010 <- prison_rate %>%
  filter(year == 2010) %>%
  summarize(mean_white_prison_pop_rate = mean(white_prison_pop_rate, na.rm = TRUE))
print(mean_white_pop_rate_2010)

# Mean of black prison population rate in 2010
mean_black_pop_rate_2010 <- prison_rate %>%
  filter(year == 2010) %>%
  summarize(mean_black_prison_pop_rate = mean(black_prison_pop_rate, na.rm = TRUE))
print(mean_black_pop_rate_2010)

## Data
num_obs_pop <- nrow(prison_population)
num_features_pop <- ncol(prison_population)
num_obs_rate <- nrow(prison_rate)
num_features_rate <- ncol(prison_rate)
