library(dplyr)
library(tidyverse) 


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
