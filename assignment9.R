data("ToothGrowth", package = "datasets")
head(ToothGrowth)

ToothGrowth$dose <- factor(ToothGrowth$dose)


supp_colors <- ifelse(ToothGrowth$supp == "OJ", "darkorange", "steelblue")

plot(
  as.numeric(ToothGrowth$dose),
  ToothGrowth$len,
  col    = supp_colors,
  pch    = 16,
  main   = "Base R: Tooth Length by Dose",
  xlab   = "Dose (mg/day)",
  ylab   = "Tooth Length (mm)",
  xaxt   = "n"
)
axis(1, at = 1:3, labels = levels(ToothGrowth$dose))
legend(
  "topleft",
  legend = c("OJ", "VC"),
  col    = c("darkorange", "steelblue"),
  pch    = 16,
  title  = "Supplement"
)

hist(
  ToothGrowth$len,
  breaks = 10,
  col    = "steelblue",
  border = "white",
  main   = "Base R: Distribution of Tooth Length",
  xlab   = "Tooth Length (mm)",
  ylab   = "Frequency"
)


library(lattice)

xyplot(
  len ~ dose | supp,
  data   = ToothGrowth,
  pch    = 16,
  col    = "steelblue",
  main   = "Lattice: Tooth Length by Dose, Conditioned on Supplement",
  xlab   = "Dose (mg/day)",
  ylab   = "Tooth Length (mm)"
)

bwplot(
  len ~ dose,
  data   = ToothGrowth,
  main   = "Lattice: Tooth Length by Dose",
  xlab   = "Dose (mg/day)",
  ylab   = "Tooth Length (mm)",
  col    = "steelblue"
)



library(ggplot2)

ggplot(ToothGrowth, aes(x = dose, y = len, color = supp)) +
  geom_point(position = position_jitter(width = 0.1), size = 2.5, alpha = 0.8) +
  geom_smooth(aes(group = supp), method = "lm", se = TRUE) +
  scale_color_manual(
    values = c("OJ" = "darkorange", "VC" = "steelblue"),
    name   = "Supplement"
  ) +
  labs(
    title = "ggplot2: Tooth Length by Dose with Linear Trend",
    x     = "Dose (mg/day)",
    y     = "Tooth Length (mm)"
  ) +
  theme_bw()

ggplot(ToothGrowth, aes(x = len, fill = supp)) +
  geom_histogram(binwidth = 2, color = "white", alpha = 0.85) +
  facet_wrap(~ supp, labeller = label_both) +
  scale_fill_manual(values = c("OJ" = "darkorange", "VC" = "steelblue")) +
  labs(
    title = "ggplot2: Distribution of Tooth Length by Supplement",
    x     = "Tooth Length (mm)",
    y     = "Count",
    fill  = "Supplement"
  ) +
  theme_bw() +
  theme(legend.position = "none")

