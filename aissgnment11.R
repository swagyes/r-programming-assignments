library(ggplot2)
library(ggthemes)

ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "steelblue", size = 2.5, alpha = 0.8) +
  geom_rug(color = "steelblue", alpha = 0.6, linewidth = 0.4) +
  theme_tufte(base_family = "serif") +
  labs(
    title = "Dot-Dash Plot: Horsepower vs. MPG",
    x = "Horsepower (hp)",
    y = "Miles per Gallon (mpg)"
  )
