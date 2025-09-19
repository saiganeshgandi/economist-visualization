df = read.csv("Economist_Assignment_Data.csv")

View(df)

df_new =select(df, -X)

head(df_new)

pl = ggplot(df_new, aes(x = CPI, y = HDI, color = factor(Region))) +
  geom_point(size = 4, shape = 1)+
  labs( color = "Region")
pl


pl2 = pl + geom_smooth(method = 'lm', formula = y ~ log(x), se = FALSE, color = "red")

pl2

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 = pl2 +geom_text(aes(label=Country), color = "gray20",
                     data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

pl3

pl4 = pl3 + theme_bw()

pl4

pl4 +
  scale_x_continuous(name = "Corruption Perceptions Index, 2011 (10 = least corrupt)",
                     limits = c(1,10),
                     breaks = 1:10) +
  scale_y_continuous(name = "Human Development Index, 2011(1 = Best)",
                     limits = c(0.2,1),
                     breaks = seq(0.2,1.0, by =  0.1))+
  ggtitle("Corruption and Human Development")
