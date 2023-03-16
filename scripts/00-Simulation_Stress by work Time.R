#### Preamble ####
# Purpose: Read in data from the GSS
# Prerequisites: Need to know where to get GSS data
# Author: Sagith Kalaichelvam and Youngho Kim
# Email: sagith.kalaichelvam@mail.utoronto.ca
# Date: 16 March 2023
# GitHub: https://github.com/YoungKim164/workstress
library(dplyr)
library(tidyverse) 

# Reading the file
raw_data <- read_excel("inputs/data/GSS.xlsx")
clean_data <- raw_data %>% 
  select(hrs1, stress) %>% 
  filter(!str_detect(hrs1, ".i|.y|.n|.d"), str_detect(stress, "Always|Often|Sometimes|Hardly ever|Never"))

clean_data <- clean_data %>% 
  mutate(range = case_when(
    hrs1 < 20 ~ '< 20',
    hrs1 >= 20 & hrs1 < 30 ~ '20-29',
    hrs1 >= 30 & hrs1 < 40 ~ '30-39',
    hrs1 >= 40 & hrs1 < 50 ~ '40-49',
    hrs1 >= 50 & hrs1 < 60 ~ '50-59',
    hrs1 >= 60 ~ '60 over'
  ))

positions <- c("Never", "Hardly ever", "Sometimes", "Often", "Always")

clean_data %>% 
  ggplot() +
  geom_bar(aes(x = stress,  y = ..prop.., group = range, fill=factor(..x..))) +
  scale_x_discrete(limits = positions) +
  scale_y_continuous(labels = scales::percent) +
  facet_wrap(~range) +
  theme_minimal(base_size = 6) +
  theme(legend.position="none")
