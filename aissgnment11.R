library(ggplot2)
library(ggthemes)
library(latticeExtra)
library(MASS)
library(reshape2)

x <- 1967:1977
y <- c(0.5, 1.8, 4.6, 5.3, 5.3, 5.7, 5.4, 5.0, 5.5, 6.0, 5.0)

plot(y ~ x, axes = FALSE, xlab = "", ylab = "", pch = 16, type = "b")
axis(1, at = x, label = x, tick = FALSE, family = "serif")
axis(2, at = seq(1, 6, 1),
     label = sprintf("$%s", seq(300, 400, 20)),
     tick = FALSE, las = 2, family = "serif")
abline(h = 6, lty = 2)
abline(h = 5, lty = 2)
text(max(x), min(y) * 2.5,
     adj = 1, family = "serif")
text(max(x), max(y) / 1.08, labels = "5%", family = "serif")
layout(matrix(c(2, 0, 1, 3), 2, 2, byrow = TRUE),
       widths = c(4, 1), heights = c(1, 4))

par(mar = c(4, 4, 0.5, 0.5))
plot(mtcars$hp, mtcars$mpg,
     xlab = "Horsepower (hp)",
     ylab = "Miles per Gallon (mpg)",
     pch = 16, col = "steelblue",
     axes = FALSE)
axis(1, tick = FALSE, family = "serif")
axis(2, tick = FALSE, las = 2, family = "serif")

par(mar = c(0.5, 4, 2, 0.5))
hist(mtcars$hp,
     main = "", xlab = "", ylab = "",
     axes = FALSE, col = "steelblue", border = "white",
     breaks = 10)

par(mar = c(4, 0.5, 0.5, 2))
hist(mtcars$mpg,
     main = "", xlab = "", ylab = "",
     axes = FALSE, col = "steelblue", border = "white",
     breaks = 10, horiz = TRUE)

par(mfrow = c(1, 1))
