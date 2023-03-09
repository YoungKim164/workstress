library(dplyr)
library(tidyverse) 


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
  theme_minimal(base_size = 12) +
  theme(legend.position="none")
