# Chapter 6 > > Environments and functions > Learning R

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

# environments

an_enviroment <- new.env()

an_enviroment[["pythag"]] <- c(12,15,20,21)
an_enviroment$root <- polyroot(c(6, -5, 1))

assign(
  "moonday",
  weekdays(as.Date("1969/07/20")),
  an_enviroment
)

an_enviroment[["pythag"]]

an_enviroment$root

get("moonday", an_enviroment)

ls(envir = an_enviroment)
ls.str(envir = an_enviroment)
# convert to list
(a_list <- as.list(an_enviroment))
#
as.environment(a_list)
#
list2env(a_list)

# nested environment

nested_enviroment <- new.env(parent = an_enviroment)
exists("pythag", nested_enviroment)

exists("pythag", nested_enviroment, inherits = FALSE)

non_stormers <<- c(3, 7, 8, 13, 17, 18, 21)
get("non_stormers", envir = globalenv())
head(ls(envir = baseenv()), 20)

# Functions
# Creating and calling functions

# RT generates random numbers from a t-distribution: 
rt 
# Option a > the regular way
hypotenuse <- function(x, y)
{
  sqrt(x ^ 2 + y ^ 2)
}

# Option b > same as before but plain

hypotenuse <- function(x, y) sqrt(x ^ 2 + y ^ 2)
hypotenuse(3, 4)
hypotenuse(y = 24, x = 7)
hypotenuse(5, 12)

hypotenuse <- function(x = 5, y = 12)
{
  sqrt(x ^ 2 + y ^ 2)
}

hypotenuse()

formals(hypotenuse)
args(hypotenuse)
formalArgs(hypotenuse)
(body_of_hypotenuse <- body(hypotenuse))
deparse(body_of_hypotenuse)
(body_of_hypotenuse <- body(hypotenuse))

{
  sqrt(x ^ 2 + y ^ 2)
}

deparse(body_of_hypotenuse)
normalized <- function(x, m = mean(x), s = sd(x))
{
  (x - m) / s
}
normalized <- normalized(c(1, 3, 6, 10, 15))

mean(normalized)
sd(normalized)

normalized(c(1, 3, 6, 10, NA))

normalize <- function(x, m = mean(x, na.rm = na.rm),
                      s = sd(x, na.rm = na.rm), na.rm = FALSE)
{
  (x - m) / s
}
normalize(c(1, 3, 6, 10, NA))

normalize(c(1, 3, 6, 10, NA), na.rm = TRUE)

normalize <- function(x, m = mean(x, ...), s = sd(x, ...), ...)
{
  (x - m) / 2
}
normalize(c(1, 3, 6, 10, NA))
normalize(c(1, 3, 6, 10, NA), na.rm = TRUE)


# Passing functions to and from other functions
do.call(hypotenuse, list(x = 3, y = 4))

dfr1 <- data.frame(x = 1:5, y = rt(5, 1))
dfr2 <- data.frame(x = 6:10, y = rf(5, 1, 1))
dfr3 <- data.frame(x = 11:15, y = rbeta(5, 1, 1))
do.call(rbind, list(dfr1, dfr2, dfr3))

menage <- c(1, 0, 0, 1, 2, 13, 80)
mean(menage)

mean(c(1, 0, 0, 1, 2, 13, 80))

# Passing functions anonymously
x_plus_y <- function(x, y) x + y
do.call(x_plus_y, list(1:5, 5:1))

(emp_cum_dist_fn <- ecdf(rnorm(50)))
is.function(emp_cum_dist_fn)

plot(emp_cum_dist_fn)

# Variable scope 

f <- function(x)
{
  y <- 1
  g <- function(x)
  {
    (x +y) / 2
  }
  g(x)
}

f(sqrt(5))


f <- function(x)
{
  y <- 1
  g(x)
}
g <- function(x)
{
  (x + y) / 2
}
f(sqrt(5))

h <- function(x)
{
  x * y
}

h(9)

y <- 16
h(9)

h2 <- function(x)
{
  if(runif(1) > 0.5) y <- 12
  x * y
}

replicate(10, h2(9))

# Summary
# Test your knowledge
# 6.1
# User's workplace'

# 6.2
# as.environment or list2env 

# 6.3
# by typing the function

# 6.4
# formals, args & formalArgs.

# 6.5
# do.calls

# Exercise
# Exercise 6.1
multiples_of_pi <- new.env()
multiples_of_pi[["two_pi"]] <- 2 * pi
multiples_of_pi$three_pi <- 3 * pi
assign("four_pi", 4 * pi, multiples_of_pi)
ls(multiples_of_pi)

# Exercise 6.2
is_even <- function(x) (x %% 2) == 0
is_even(c(-5:5, Inf, -Inf, NA, NaN))

# Exercise 6.3

args_and_body <- function(fn)
{
  list(arguments = formals(fn), body = body(fn))
}
args_and_body(var)
args_and_body(alarm)



































