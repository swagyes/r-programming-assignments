---
title: "R markdown intro"
author: "orestes gonzalez"
output: html_document
date: "2026-04-13"
---
# R Markdown
R Markdown is a framework that allows me to combine narrative text, code, and math into a single document. It is essential for data analytics because it makes research reproducible; instead of copy-pasting graphs, the document generates them directly from the data.

# Math
R Markdown handles complex math using LaTeX. This is great for documenting statistical models.

Inline Equation: The formula for a simple line is $y = mx + b$.
Display Equation:
$$
\bar{x} = \frac{\sum_{i=1}^{n} x_i}{n}
$$

# Data Analysis
For this practice, I am using the built-in `mpg` dataset to look at vehicle fuel efficiency.
```{r load-data, message=FALSE}
library(ggplot2)
data(mpg)

summary(mpg$hwy)

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal() +
  labs(title = "Engine Displacement vs. Highway MPG",
       x = "Engine Displacement (L)",
       y = "Highway MPG")
```

#Reflection
Working with R Markdown is much more organized than using a standard word processor. Integrating the code chunks directly with the text ensures that there are no discrepancies between my data and my report. One surprise was how easy it is to render LaTeX math once you get the dollar sign syntax down. This workflow is definitely better for data-heavy projects where accuracy is non-negotiable.
