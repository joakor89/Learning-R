# Chapter 7 > Strings & factors 

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

#Strings
# Constructing and printing strings

c(
  "You sould use double quotes most of the time",
  'Single quotes are better for including "inside the string'
)

paste(c("red", "yellow", "lorry"))
paste(c("red", "yellow"), "lorry", sep = "-")
paste(c("red", "yellow"), "lorry", collapse = ", ")
paste0(c("red", "yellow"), "lorry")

x <- (1:15) ^ 2
toString(x)

toString(x, width = 40)
cat(c("red", "yellow"), "lorry")

x <- c(
  "I", "saw", "a", "saw", "that", "could", "out",
  "saw", "any", "other", "saw", "I", "ever", "saw"
  )
y <- noquote(x)
x
y

# Formatting numbers
pow <- 1:3
(powers_of_e <- exp(pow))

formatC(powers_of_e)
formatC(powers_of_e, digits = 3)
formatC(powers_of_e, digits = 3, width = 10)
formatC(powers_of_e, digits = 3, format = "e")
formatC(powers_of_e, digits = 3, flag = "+")

sprintf("%s %d = %f", "Euler's constant to the power", pow, powers_of_e)
sprintf("To three decimal places, e ^ %d = %.3f", pow, powers_of_e)
sprintf("In scientific notation, e ^ %d = %e", pow, powers_of_e)
format(powers_of_e)
format(powers_of_e, digits = 3)
format(powers_of_e, digits = 3, trim = TRUE)
format(powers_of_e, digits = 3, scientific = TRUE)

prettyNum(
  c(1e10, 12 -20),
  big.mark = ",",
  small.mark = " ",
  preserve.width = "individual",
  scientific = FALSE
)

# Special characters

cat("foo\bar", fill = TRUE)

cat("foo\nbar", fill = TRUE)

cat("foo\bar", fill = TRUE)

cat("foo\\bar", fill = TRUE)

cat("foo\"bar", fill = TRUE)

cat('foo\'bar', fill = TRUE)

cat("foo'bar", fill = TRUE)

cat('foo"bar', fill = TRUE)

cat("\a")
alarm()

# Changing case

toupper("I'm shouting")
tolower("I'm whispering")

# Extracting substrings

woodchuck <- c(
  "How much wood would a woodchuch chuck",
  "if a woodchuck could chuck wood?",
  "he would chuck, he would, as much as he could",
  "And chuck as much as wood as a woodchuck would",
  "If a woodchuck could chuck wood"
)

substring(woodchuck, 1:6, 10)
substr(woodchuck, 1:6, 10)

# Splitting strings
strsplit(woodchuck, " ", fixed = TRUE)
strsplit(woodchuck, ",? ")
getwd() # setwd()
R.home()
path.expand(".")
path.expand("..")
path.expand("~")

# Factors
# Creating factors

(heights <- data.frame(
  heights_cm = c(153,181, 150, 172, 165, 149, 174, 169, 198, 163),
  gender = c(
    "female", "male", "female", "male", "male",
    "female", "female", "male", "male", "female"
  )
))

class(heights$gender)
heights$gender

heights$gender[1] <- "Female"
heights$gender
levels(heights$gender)

nlevels(heights$gender)
gender_char <- c(
  "female", "male", "female", "male", "male",
  "famele", "female", "male", "male", "female"
)
(gender_fac <- factor(gender_char))

# Changing factor levels
factor(gender_char, levels = c("male", "female"))

factor(gender_fac, levels =  c("male", "female"))

# levels(gender_fac) <- c("male", "female")
# gender_fac

relevel(gender_fac, "male")

# Dropping factor levels

getting_to_work <- data.frame(
  mode = c(
    "bike", "car", "bus", "car", "walk",
    "bike", "car", "bike", "car", "car"
  ),
  time_mins = c(25, 13, NA, 22, 65, 28, 15, 24, NA, 14)
)

(getting_to_work <- subset(getting_to_work, !is.na(time_mins)))

unique(getting_to_work$mode)

getting_to_work$mode <- droplevels(getting_to_work$mode)
getting_to_work <- droplevels(getting_to_work)
levels(getting_to_work$mode)

# Ordered factors

happy_choices <- c("depressed", "grumpy", "so-so", "cheery", "ecstatic")
happy_values <- sample(
  happy_choices,
  10000,
  replace = TRUE
)
happy_fac <- factor(happy_values, happy_choices)
head(happy_fac)

happy_ord <- ordered(happy_values, happy_choices)
head(happy_ord)

is.factor(happy_ord)
is.ordered(happy_fac)

# Converting continuoues variables to categorical
ages <- 16 + 50 * rbeta(10000, 2, 3)
grouped_ages <- cut(ages, seq.int(16, 66, 10))
head(grouped_ages)
table(grouped_ages)

class(ages)
class(grouped_ages)

# Converting categorical variables to continuous 
dirty <- data.frame(
  x = c("1.23", "4.56", "7.89")
)

as.numeric(dirty$x)
as.numeric(as.character(dirty$x))
as.numeric(levels(dirty$x))[as.integer(dirty$x)]
factor_to_numeric <- function(f)
{
  as.numeric(levels(f))[as.integer(f)]
}

# Generating factor levels
gl(3, 2)
gl(3, 2, labels = c("placebo", "drug A", "drug B"))
gl(3, 1, 6, labels = c("placebo", "drug A", "drug B"))

# Combining factors 

treatment <- gl(3, 2, labels = c("placebo", "drug A", "drug B"))
gender <- gl(2, 1, 6, labels = c("female", "male"))
interaction(treatment, gender)

# Test your knowledge 

# 7.1
# format, formatC, sprintf $ PRETTYnUM

# 7.2
# Using alarm - \a 

# 7.3
# factor ordered

# 7.4
# counted as missing(NA)

# 7.5
# Use cut to bin it


# Exercise
# Exercise 7.1
formatC(pi, digits = 16)

# Exercise 7.2

x <- c(
  "Swan swan over the pond, Swin swan swim!",
  "Swan swan back again - Well swum swan!"
)

strsplit(x, ",? -? ?")
strsplit(x, ",? (-)?")

# Exercise 7.3

# n specifies the number of score's to generate.
# It should be a natural number
three_d6 <- function(n)
{
  random_numbers<- matrix(
  sample(6, 3 * n, replace = TRUE),
  nrow = 3
)
  colSums(random_numbers)
}

# Answer
scores <- three_d6(1000)
bonuses <- cut(
  scores,
  c(2, 3, 5, 8,12, 15, 17, 18),
  labels = -3:3
)
table(bonuses)





