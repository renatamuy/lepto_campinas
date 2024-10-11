# Renata Muylaert - 2024 

library(ggplot2)

data <- data.frame( Years = 2001:2023,
  Cases = c(21, 12, 32, 16, 31, 26, 23, 22, 41, 39, 
            41, 42, 41, 39, 16, 22, 10, 7, 11, 4, 
            3, 11, 11))

data$highlight <- ifelse(data$Years >= 2007 & data$Years <= 2010, "2007-2010", "Other")

p <- ggplot(data, aes(x = Years, y = Cases, color = highlight, group = 1)) +
  geom_line(size = 1.2) +
  geom_point(size = 4.5) +
  geom_label(aes(label = Cases), vjust = -.5, size = 4, label.size = 0, fill = "white") +  
  scale_color_manual(values = c("2007-2010" = "firebrick", "Other" = "black")) +
  scale_x_continuous(breaks = seq(2001, 2023, by = 1)) +
  labs(title = "", x = "Year", y = "Leptospirosis cases") +
  theme_minimal() +
  theme(legend.position = "none", 
    axis.title.x = element_text(size = 16),
    axis.title.y = element_text(size = 16),
    axis.text.x = element_text(size = 14, angle = 45, hjust = 1),  
    axis.text.y = element_text(size = 14))

p

setwd('D://OneDrive - Massey University//lepto_campinas//')

ggsave("Leptospirosis_Cases_Per_Year.jpg", plot = p, width =11, height = 7, dpi = 300)

#-----------------------------------------------------------------------------------------------------------