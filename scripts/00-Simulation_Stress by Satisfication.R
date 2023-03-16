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
  select(satjob, stress) %>% 
  filter(str_detect(satjob, "Very satisfied|Moderately satisfied|A little dissatisfied|Very dissatisfied"),
         str_detect(stress, "Always|Often|Sometimes|Hardly ever|Never"))


positions <- c("Never", "Hardly ever", "Sometimes", "Often", "Always")

clean_data %>% 
  ggplot() +
  geom_bar(aes(x = stress,  y = ..prop.., group = satjob, fill=factor(..x..))) +
  scale_x_discrete(limits = positions) +
  scale_y_continuous(labels = scales::percent) +
  facet_wrap(~satjob) +
  theme_minimal(base_size = 6) +
  theme(legend.position="none")
