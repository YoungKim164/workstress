library(dplyr)
library(tidyverse) 


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
  theme_minimal(base_size = 12) +
  theme(legend.position="none")
