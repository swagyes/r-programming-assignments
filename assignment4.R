Freq <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)

bloodp <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
first <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)

second <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)

finaldecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)

boxplot(bloodp,
        main = "Boxplot of Patient Blood Pressure",
        ylab = "Blood Pressure",
        col = "lightgray")

hist(bloodp,
     main = "Histogram of Patient Blood Pressure",
     xlab = "Blood Pressure",
     col = "lightgray",
     breaks = 5)

#https://rprogramingorestes.blogspot.com/2026/02/module-4-assignment.html
