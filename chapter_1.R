install.packages("tidyverse")
library(tidyverse)
install.packages("palmerpenguins")
library(palmerpenguins)

# How to get help in R
"Hello world!"
mean(1:5)
?mean # opens the help peage for the mean function
?"+" # opens the help peage for addition
?"if" # opens the help peage for if, used for branching code
??ploting # searches for topics containing words like "plotting"
??"regresion model" # searches for topics containing phrases like this

help("mean")
help.search("plotting")
help.search("regression model")

a_vector <- c(1, 3, 6, 10)
apropos("vector")
apropos("a_vector")
apropos("z$")
apropos("[4-9]")

example(plot)
demo()
demo(japanese)
vignette("Sweave", package = "utils")

# Installing extra related software
install.packages("installr")
library(installr)
install.RStudio()
install.Rtools()
install.git()

sd(0:100)

# demo(plotmath)
# return()

# Test your knowledge

# 1) It's a well know open source and internally works with S 
# 2) Can perfom functions and object oriented programming O.O.P
# 3) c(8:27)
# 4) help()
# 5) It's RSiteSearch

# Exercises

# Exercise 1.1
help()

# Exercise 1.2
sd(0:100)

# Exercise 1.3






