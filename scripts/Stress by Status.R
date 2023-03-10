library(dplyr)
library(tidyverse) 


raw_data <- read_excel("inputs/data/GSS.xlsx")
clean_data <- raw_data %>% 
  select(wrkstat, stress) %>% 
  filter(str_detect(stress, "Always|Often|Sometimes|Hardly ever|Never"),
         str_detect(wrkstat, "Working full time|Working part time"))

positions <- c("Never", "Hardly ever", "Sometimes", "Often", "Always")

clean_data %>% 
  ggplot(aes(group = wrkstat)) +
  geom_bar(aes(x=stress, y = ..prop.., fill=factor(..x..)))+
  labs(y = "Percent", fill="Work Stress", x = 'Work Stress', title = "Work Stress by Work status" ) +
  facet_wrap(~wrkstat) +
  scale_x_discrete(limits = positions) +
  scale_y_continuous(labels = scales::percent) +
  theme_minimal(base_size = 12) +
  theme(legend.position="none")
