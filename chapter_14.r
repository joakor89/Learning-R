# Chapter 14 > Exploring & visualizing > R learning 

# Packages
install.packages("tidyverse")
library(tidyverse)
install.packages("class")
library(class)
install.packages("dtplyr")
library(dtplyr)

install.packages("Matrix")
library(Matrix)
install.packages("ggplot2")
library(ggplot2)

install.packages("learningr")
library(learningr)
install.packages("lattice")
library(lattice)
install.packages("devtools")
library(devtools)

# Summary statistics

data("obama_vs_mccain", package = "learningr")
obama <- obama_vs_mccain$Obama
mean(obama)

table(cut(obama, seq.int(0, 100, 10)))
var(obama)
sd(obama)
mad(obama)

min(obama)
with(obama_vs_mccain, pmin(Obama, McCain))

range(obama)

cummin(obama)
cumsum(obama)
cumprod(obama)
quantile(obama)

quantile(obama, type = 5)
quantile(obama, c(0.9, 0.95, 0.99))
IQR(obama)

fivenum(obama)
summary(obama_vs_mccain)
with(obama_vs_mccain, cor(Obama, McCain))
with(obama_vs_mccain, cancor(Obama, McCain))

# The Three plotting systems

obama_vs_mccain <- obama_vs_mccain[!is.na(obama_vs_mccain$Turnout),]
with(obama_vs_mccain, plot(Income, Turnout))
with(obama_vs_mccain, plot(Income, Turnout, col = "violet", pch = 20))
with(obama_vs_mccain, plot(Income, Turnout, log = "y"))
with(obama_vs_mccain, plot(Income, Turnout,col = "green", log = "xy"))

par(mar = c(3, 3, 0.5, 0.5), oma = rep.int(0, 4), mgp = c(2, 1, 0))
regions <- levels(obama_vs_mccain$Region)
plot_numbers <- seq_along(regions)
layout(matrix(plot_numbers, ncol = 5, byrow = TRUE))
for(region in regions)
{
  regional_data <- subset(obama_vs_mccain, Region == region)
  with(regional_data, plot(Income, Turnout))
}

# Take 2: lattice graphics
xyplot(Turnout ~ Income, obama_vs_mccain)
xyplot(Turnout ~ Income, obama_vs_mccain, col = "violet")
xyplot(Turnout ~ Income, obama_vs_mccain, col = "violet", pch = 20)

xyplot(
  Turnout ~ Income,
  obama_vs_mccain,
  scales = list(log = TRUE)
)

xyplot(
  Turnout ~ Income,
  obama_vs_mccain,
  pch = 20,
  col = "red",
  scales = list( y = list(log = TRUE))
)

xyplot(
  Turnout ~ Income | Region,
  obama_vs_mccain,
  scales = list(
    log = TRUE,
    relation = "same",
    alternating = FALSE
  ),
  layout = c(5, 2)
)

(lat1 <- xyplot(
  Turnout ~ Income | Region,
  obama_vs_mccain
))

(lat2 <- update(lat1, col = "violet", pch = 20))

# Take 3: ggplot2 graphics 
ggplot(obama_vs_mccain, aes(Income, Turnout)) +
  geom_point()

ggplot(obama_vs_mccain, aes(Income, Turnout)) +
  geom_point(color = "violet", shape = 20)

ggplot(obama_vs_mccain, aes(Income, Turnout)) +
  geom_point() +
  scale_x_log10(breaks = seq(2e4, 4e4, 1e4)) +
  scale_y_log10(breaks = seq(50, 75, 5))
  
ggplot(obama_vs_mccain, aes(Income, Turnout)) +
  geom_point() +
  scale_x_log10(breaks = seq(2e4, 4e4, 1e4)) +
  scale_y_log10(breaks = seq(50, 75, 5)) +
  facet_wrap(~ Region, ncol = 4)

(gg1 <- ggplot(obama_vs_mccain, aes(Income, Turnout)) +
    geom_point()
  )

gg2 <- gg1 +
  facet_wrap(~ Region, ncol = 5) +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))

# Line plots
data("crab_tag", package = "learningr")

with(
  crab_tag$daylog,
  plot(Date, -Max.Depth, type = "l", ylim = c(-max(Max.Depth), 0))
)
  
with(
  crab_tag$daylog,
  lines(Date, -Min.Depth, col = "blue")
)  

xyplot(-Min.Depth + -Max.Depth ~ Date, crab_tag$daylog, type = "l")

ggplot(crab_tag$daylog, aes(Date, -Min.Depth)) +
  geom_line()

ggplot(crab_tag$daylog, aes(Date)) +
  geom_line(aes(y = -Max.Depth)) +
  geom_line(aes(y = -Min.Depth))

install.packages("reshape2")
library(reshape2)
crab_long <- melt(
  crab_tag$daylog,
  id.vars = "Date",
  measure.vars = c("Min.Depth", "Max.Depth")
)
ggplot(crab_long, aes(Date, -value, group = variable)) +
  geom_line()

ggplot(crab_tag$daylog, aes(Date, ymin = -Min.Depth, ymax = -Max.Depth)) +
  geom_ribbon(color = "black", fill = "violet")

# Histograms

with(obama_vs_mccain,
     hist(Obama, 4, main = "An exact number of bins", col = "yellow")
)

with(obama_vs_mccain,
     hist(Obama, seq.int(0, 100, 5), main = "A vector of bin edges", col = "red")
)

with(obama_vs_mccain,
     hist(Obama, "FD", main = "The name of a method", col = "blue")
)

with(obama_vs_mccain,
     hist(Obama, nclass.scott, main = "A function for the number of bins", col = "yellow")
)

binner <- function(x)
{
  seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length.out = 50)
}
with(obama_vs_mccain,
     hist(Obama, binner, main = "A function for the bin edges", col = "orange")
)

with(obama_vs_mccain, hist(Obama, freq = FALSE, col = "dark green"))

histogram(~ Obama, obama_vs_mccain)

histogram(~ Obama, obama_vs_mccain, breaks = 10, col = "purple")

histogram(~ Obama, obama_vs_mccain, type = "percent", col ="brown")

ggplot(obama_vs_mccain, aes(Obama)) +
  geom_histogram(binwidth = 5, col = "orange")

ggplot(obama_vs_mccain, aes(Obama, ..density..)) +
  geom_histogram(binwidth = 5, col = "yellow")

# Box plots

boxplot(Obama ~ Region, data = obama_vs_mccain, col = "blue")

ovm <- within(
  obama_vs_mccain,
  Region <- reorder(Region, Obama, median)
)

boxplot(Obama ~ Region, data = ovm, col = "orange")

bwplot(Obama ~ Region, data = ovm, col = "dark green")

ggplot(ovm, aes(Region, Obama)) +
  geom_boxplot()

# Bar charts 

ovm <- ovm[!(ovm$State %in% c("Alaska", "Hawaii")), ]

religions <- with(ovm, rbind(Catholic, Protestant, Non.religious, Other))
colnames(religions) <- ovm$State
par(las = 1, mar = c(3, 9, 1, 1))
# Bar Plot
barplot(religions, horiz = TRUE, beside = FALSE)

# Bar Chart
barchart(State ~ Catholic, ovm)

barchart(
  State ~ Catholic + Protestant + Non.religious + Other,
  ovm,
  stack = TRUE
)

# Bar chart with cood_flip

religions_long <- melt(
  ovm,
  id.vars = "State",
  measure.vars = c("Catholic", "Protestant", "Non.religious", "Other")
)

ggplot(religions_long, aes(State, value, fill = variable)) +
  geom_bar(stat = "identity") +
  coord_flip()

ggplot(religions_long, aes(State, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip()

# Other plotting packages and systems 

# vcd package
# plotrix package
# latticeExtra
# GGally

# last two above extent lattice and ggplot2

# gridSVG
# googleVis
# rggobi

# Test your knowledge

# 14-1
# min return smallest values of all its inputs
# pmin accepts several vectors

# 14-2
# pass the pch("plot character) argument

# 14-3
# An aesthetic specifies a variable, color and shape

# Exercise
# Loading datasets required

data("obama_vs_mccain", package = "learningr")
data("alpe_d_huez2", package = "learningr")
data("gonorrhoea", package = "learningr")

# Exercise 14.1

# 14.1.1
with(obama_vs_mccain, cor(Unemployment, Obama))

# 14.1.2
with(obama_vs_mccain, plot(Unemployment, Obama))
xyplot(Obama ~ Unemployment, obama_vs_mccain)
ggplot(obama_vs_mccain, aes(Unemployment, Obama,  col = "orange")) +
  geom_point()

# Exercise 14.2

# 14.2.1 Histograms:

plot_numbers <- 1:2
layout(matrix(plot_numbers, ncol = 2, byrow = TRUE))
for(drug_use in c(FALSE, TRUE))
{
  group_data <- subset(alpe_d_huez2, DrugUse == drug_use)
  with(group_data, hist(NumericTime))
}

histogram(~ NumericTime | DrugUse, alpe_d_huez)

ggplot(alpe_d_huez2, aes(NumericTime)) +
  geom_histogram(binwidth = 2) +
  facet_wrap(~ DrugUse)

# 14.2.2 Blox plots

boxplot(NumericTime ~ DrugUse, alpe_d_huez2, col = "purple")
bwplot(DrugUse ~ NumericTime, alpe_d_huez, col = "green")

ggplot(alpe_d_huez2, aes(DrugUse, NumericTime, group = DrugUse)) +geom_boxplot()

# 14.2.3

# A)
ggplot(gonorrhoea, aes(Age.Group, Rate)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ Year + Ethnicity + Gender)

# B)
ggplot(gonorrhoea, aes(Age.Group, Rate, group = Year, fill = Year)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ Ethnicity + Gender)

# C)
ggplot(gonorrhoea, aes(Age.Group, Rate, group = Year, color = Year)) +
  geom_line() +
  facet_wrap(~ Ethnicity + Gender)


# D)
ggplot(gonorrhoea, aes(Age.Group, Rate, group = Year, color = Year)) +
  geom_line() +
  facet_grid(Ethnicity ~ Gender)

# E)
ggplot(gonorrhoea, aes(Age.Group, Rate, group = Year, color = Year)) +
  geom_line() +
  facet_grid(Ethnicity ~ Gender, scales = "free_y")







































































































