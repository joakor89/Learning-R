# Chapter 15 > Distribution & modeling > R learning 

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

install.packages("stats")
library(stats)

# Other model types
install.packages("caret")
library(caret)
install.packages("nlme")
install.packages("betareg")
install.packages("rpart")
library(ipred)
install.packages("randomForest")
library(randomForest)



# Random numbers
# The sample function

sample(7)
sample(7, 5)
# by default sample does not allows replacement, the it has to be instructed it
sample(7, 10, replace = TRUE)

sample(colors(), 5)
sample(.leap.seconds, 4)

# Probability argument

weights <- c(1, 1, 2, 3, 5, 8, 13, 21, 8, 3, 1, 1)
sample(month.abb, 1, prob = weights)

# Sampling from distributions
?distribution

runif(5)
runif(5, 1, 10)
rnorm(5)
rnorm(5, 3, 7)

?RNGkind
RNGkind()

set.seed(1)
runif(5)

set.seed(1)
runif(5)

set.seed(1)
runif(5)

# Distributions 
# these functions start with d, p and q like dnorm, pnorm, qnorm

#Formulae

Rate ~ Year + Age.Group + Ethnicity + Gender
Rate ~ 0 + Year + Age.Group + Ethnicity + Gender
Rate ~ Year * Age.Group * Ethnicity * Gender
Rate ~ Year + Ethnicity + Gender + Year:Ethnicity + Year:Ethnicity:gender
Rate ~ (Year + Ethnicity + Gender) ^ 2
Rate ~ I(Year ^ 2)

# A first model: Linear Regressions 
# lm for "linear model".

model1 <- lm(Rate ~ Year + Age.Group + Ethnicity + Gender, gonorrhoea)
model1

lapply(Filter(is.factor, gonorrhoea), levels)
summary(model1)

# Comparing & updating models
model2 <- update(model1, ~. - Year)
summary(model2)

# The anova function recall ANalysis Of VAriance tables for models
anova(model1, model2)
# AKAIKE & Bayesian Information criteria
# AIC & BIC functions

AIC(model1, model2)
BIC(model1, model2)

silly_model <- update(model1, ~. - Age.Group)
anova(model1, silly_model)
AIC(model1, silly_model)
BIC(model1, silly_model)

model3 <- update(model2, ~. - Gender)
summary(model3)

g2 <- within(
  gonorrhoea,
  {
    Age.Group <- relevel(Age.Group, "30 to 34")
    Ethnicity <- relevel(Ethnicity, "Non-Hispanic Whites")
  }
)

model4 <- update(model3, data = g2)
summary(model4)

plot_numbers <- 1:6
layout(matrix(plot_numbers, ncol = 2, byrow = TRUE))
plot(model4, plot_numbers)

gonorrhoea[c(40, 41, 160), ]
str(model4)
unclass(model4)

# More convinient approach such as formula, nobs, residuals, fitted &
# coefficients:

formula(model4)

nobs(model4)

head(residuals(model4))

head(fitted(model4))

head(coefficients(model4))

head(cooks.distance(model4))
summary(model4)$r.squared

diagnostics <- data.frame(
  residuals = residuals(model4),
  fitted = fitted(model4)
)
ggplot(diagnostics, aes(fitted, residuals))+
  geom_point() +
  geom_smooth(method = "loess")

new_data <- data.frame(
  Age.Group = "30 to 34",
  Ethnicity = "Non-Hispanic Whites"
)
predict(model4, new_data)

subset(
  gonorrhoea,
  Age.Group == "30 to 34" & Ethnicity == "Non-Hispanic Whites"
)

# Other model types

glm(true_or_false ~ some + some predictor + variables, data, family = binomial())


# Test your knowledge

# 15-1
# Answer:
# set.seed

# 15-2
# Answer:
# PDF named at the beginning by d
# CDF start with p with name of the distribution recall
# and inversevely CDF followed q 

# 15-3
# Answer:
# colons between variables represent interaction between them

# 15-4
# Answer: For contrast models work AIC, BIC & anova

# 15-5
# Answer: the square value is can be found out by summary(model)$r.squared

# Exercise 
# Exercise 15.1
# 15.1.1
dpois(3, 3)
# 15.1.2
pnbinom(12, 1, 0.25)
# 15.1.3
qbirthday(0.9)

# Exercise 15.2
model1 <- lm(
  Rate ~ Year + Age.Group + Ethnicity + Gender,
  gonorrhoea,
  subset = Age.Group %in% c("15 to 19", "20 to 24", "25 to 29", "30 to 34")
)
summary(model1)

# 15.2.2
model2 <- update(model1, ~. -Year)
summary(model2)

# Exercise 15.3
install.packages("betareg")
library(betareg)
ovm <- within(obama_vs_mccain, Obama <- Obama / 100)
beta_model1 <- betareg(
  Obama ~ Turnout + Population + Unemployment + Urbanization + Black + Protestant,
  ovm,
  subset = State != "District of Columbia"
)
summary(beta_model1)

beta_model2 <- update(beta_model1, ~. - Urbanization)
summary(beta_model2)

beta_model3 <- update(beta_model2, ~. - Population)
summary(beta_model3)

plot_numbers <- 1:6
layout(matrix(plot_numbers, ncol = 2, byrow = TRUE))
plot(beta_model3, plot_numbers)









