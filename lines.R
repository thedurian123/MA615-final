library(dplyr)
library(tidyverse)
library(ggpolt)
lines <- read.csv("C:/Users/Haoyue/Desktop/lines.csv")
ggplot(data = lines, mapping = aes(x = line_sort_order,color = line_color)) +
  geom_histogram()