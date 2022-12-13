# Chapter 3 Inspecting variables and your workspace
#Installing package
install.packages("tidyverse")
library(tidyverse)
install.packages("class")
library(class)
install.packages("Matrix")
library(Matrix)

# Classes
class(c(TRUE, FALSE))

# Different types of numbers
# There are three types in R numeric, integer, complex
class(sqrt(1:10)) "Numeric"

class(3 + 1i) "Complex"

class(1) "Numeric"

class(1L) "Ingeter"

class(0.5:4.5) "Numeric"

class(1:5) "Integer"

# Other common classes 

# Also, there are three clasess of vectors
# Character for storing text, Factors for storing categorical data
# and raw for storing binary data

class(c("she", "seashells", "on", "the", "sea", "shore")) # Character class

(gender <- factor(c("male", "female", "female", "male", "female")))

# Installing Rmpfr for floating precision

install.packages("Rmpfr")
library(Rmpfr)

levels(gender)

nlevels(gender)
# Are store as integers for memory-efficiency
as.integer(gender)

gender_char <- sample(c("female", "male"), 10000, replace = TRUE)
gender_fac <- as.factor(gender_char)
object.size(gender_char)
as.character(gender)

as.raw(1:17)

#This will drop a warning
as.raw(c(pi, 1 +1i -1, 256))

(sushi <- charToRaw("Fish!"))
class(sushi)

# Checking and changing classes

is.character("red lorry, yellow lorry")
is.logical(FALSE)
is.list(list(a = 1, b = 2))

# ls list variable names, match strings that begin with "is
#base env a function that just returns the enviroment of the base package
ls(pattern = "^is", baseenv())

is.numeric(1)
is.numeric(1L)
is.integer(1)
is.integer(1L)
is.double(1)
is.double(1L)

x <- "123.456"
as(x, "numeric")

as.numeric(x)
y <- c(2, 12, 343, 34997)
as(y, "data.frame")
as.data.frame(y)

x <- "123.456"
class(x) <- "numeric"

is.numeric(x)

# Examining variables

ulams <- c(1, 8, 23, 46, 77)
for(i in ulams_spiral) i
for(i in ulams_spiral) print(i)

num <- runif(30)
summary(num)

fac <- factor(sample(letters[1:5], 30, replace = TRUE))
summary(fac)

bool <- sample(c(TRUE, FALSE, NA), 30, replace = TRUE)
summary(bool)

dfr <- data.frame(num, fac, bool)
head(dfr)
summary(dfr)

str(num)
str(dfr)
unclass(fac)
attributes(fac)

View(dfr)
new_dfr <- edit(dfr)
fix(dfr)

View(head(dfr, 50))

# The workspace

peach <- 1
plum <- "fruity"
pear <- TRUE
ls()
ls(pattern = "ea")
browseEnv()

rm(peach, plum, pear)
rm(list = ls())

# Test your knowledge
# 1) Names of three built- in number classes
# Numeric, integer & complex

# 2) function call for levels
nlevels 

# 3) convert "6.213885" into numbers
# as.numeric("6.213885")

# 4) 3 functions for inspecting variable parameters
#  head, summary, View






# Exercise 3 

# Exercise 3.1 
class(Inf)
class(NA)
class(NaN)
class("")

typeof(Inf)
typeof(NA)
typeof(NaN)
typeof("")

mode(Inf)
mode(NA)
mode(NaN)
mode("")

storage.mode(Inf)
storage.mode(NA)
storage.mode(NaN)
storage.mode("")

#Exercise 3.2

pets <- factor(sample(c("dog", "cat", "hamster", "goldfish"), 1000, replace = TRUE))
head(pets)
summary(pets)

# Exercise 3.3
carrot <- 1
potato <- 2
swede <- 3
ls(pattern = "a")











