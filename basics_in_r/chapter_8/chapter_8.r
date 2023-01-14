# Chapter 8 > Flow control & loops > R learning
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

# Flow control

if(TRUE) message(" it was true!")

if(FALSE) message("it wasn't true!")

if(NA) message("Who knows if it was true?")

if(is.na(NA)) message("The value is missing!")

if(runif(1) > 0.5) message("This message appears with a 50% chance.")

x <- 3
if(x > 2)
{
  x <- 2 * x
  z <- 3 * y
}

# if statement

if(FALSE)
{
  message("this won't execute...")
} else
{
  message("but this will.")
}

# else statement

if(FALSE)
{
  message("This won't execute...")
} else
{
  message("and you'll get an error before you reach this.")
}

# ifelse statement

(r <- round(rnorm(2), 1))

(x <- r[1] / r[2])

if(is.na(x))
{
  message("x is missing")
} else if(is.infinite(x))
{
  message("x is inifite")
} else if(x > 0)
{
  message(" x is positive")
} else if(x < 0)
{
  message("x is negative")
} else
{
  message("x is zero")
}

# Re component

x <- sqrt(- 1 + 0i)
(reality <- if(Re(x) == 0 )" real" else "imaginary")

# Vectorize if 

ifelse(rbinom(10, 1, 0.5), "Head", "Tail")

(yn <- rep.int(c(TRUE, FALSE), 6))

ifelse(yn, 1:3, -1:12)

yn[c(3, 6, 9, 12)] <- NA
ifelse(yn, 1:3, -1:-12)

# Multiple selection

(greek <- switch(
  "gamma",
  alpha = 1,
  beta = sqrt(4),
  gamma = 
    {
      a <- sin(pi / 3)
      4 * a ^ 2
    }
))

# switch invisible
(greek <- switch(
  "delta",
  alpha = 1,
  beta = sqrt(4),
  gamma =
    {
      a <- sin(pi / 3)
      4 * a ^ 2
    }
))

#

(greek <- switch(
  "delta",
  alpha = 1,
  beta = sqrt(4),
  gamma =
    {
      a <- sin(pi / 3)
      4 * a ^ 2
    },
  4
))

switch(
  3,
  "first",
  "second",
  "third",
  "fourth"
)

switch(
  as.character(2147483647),
  "2147483647" = "a big number",
  "another number"
)

# Loops
# there are three kind of loops in r:
# repeat, while and for.

repeat
{
  message("Happy Groundhog Day!")
}

# For loop

for(i in 1:5) message("i =", i)

for(i in 1:5)
{
  j <- i ^ 2
  message("j = ", j)
}
  
#
for(month in month.name)
{
  message("The month of ", month)
}

#

for(yn in c(TRUE, FALSE, NA))
{
  message("This statement is ", yn)
}

#

l <- list(
  pi,
  LETTERS[1:5],
  charToRaw("not as complicated as it looks"),
  list(
    TRUE
  )
)
for(i in l)
{
  print(i)
}

# Test your knowledge
# 8. 1
# If will thrown an error if you pass NA to it

# 8.2
# ifelse will return NA where NA is passed to it

# 8.3
# switch will conditionally execute code based upon a character or integer argument

# 8.4 
# insert the keyword break into the loop

# 8.5
# insert the keyword next into the loop 

# Exercise
# Exercise 8.1

two_d6 <- function(n)
{
  random_numbers <- matrix(
    sample(6, 2 * n, replace = TRUE),
    nrow = 2
  )
  colSums(random_numbers)
}

#
# Answer: 
score <- two_d6(1)
if(score %in% c(2, 3, 12))
{
  game-status <- FALSE
  point <- NA
} else if(score %in% c(7, 11))
{
  game_status <- TRUE
  point <- NA
} else
{
  game_status <- NA
  point <- score
}

# Exercise 8.2 

if(is.na(game_status))
{
  repeat({
    score <- two_d6(1)
    if(score == 7)
    {
      game_status <- FALSE
      break
    } else
      if(socre == point)
      {
        game_status <- TRUE
        break
      }
  })
}
# Exercise 8.3

sea_shells <- c(
  "She", "sells", "sea", "shells", "by", "the", "seashore",
  "The", "shells", "she", "sells", "are", "surely", "seashells",
  "So", "if", "she", "sells", "shells", "on", "the", "seashore",
  "I'm", "sure", "she", "sells", "seashore", "shells"
)

#

nchar_sea_shells <- nchar(sea_shells)

for(i in min(nchar_sea_shells):max(nchar_sea_shells))
{
  message("These words have ", i, " letters:")
  print(toStrig(unique(sea_shells[nchar_sea_shells == i])))
}













