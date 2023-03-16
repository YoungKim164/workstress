#### Preamble ####
# Purpose: Read in data from the GSS
# Prerequisites: Need to know where to get GSS data
# Author: Sagith Kalaichelvam and Youngho Kim
# Email: sagith.kalaichelvam@mail.utoronto.ca
# Date: 16 March 2023
# GitHub: https://github.com/YoungKim164/workstress
library(dplyr)
library(tidyverse) 
library(readxl)

# Reading the file
raw_data <- read_excel("inputs/data/GSS.xlsx")
clean_data <- raw_data %>% 
  select(wrkgovt, stress) %>% 
  filter(str_detect(wrkgovt, "Government|Private"),
         str_detect(stress, "Always|Often|Sometimes|Hardly ever|Never"))


positions <- c("Never", "Hardly ever", "Sometimes", "Often", "Always")

clean_data %>% 
  ggplot() +
  geom_bar(aes(x = stress,  y = ..prop.., group = wrkgovt, fill=factor(..x..))) +
  scale_x_discrete(limits = positions) +
  scale_y_continuous(labels = scales::percent) +
  facet_wrap(~wrkgovt) +
  theme_minimal(base_size = 8) +
  theme(legend.position="none")
