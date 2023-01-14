# Chapter 16 > Programming > R learning 

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
install.packages("caret")
library(caret)

install.packages("assertive")







# Message, warnings and errors
f <- function(x)
  {
  message("'x', contains ", toString(x))
  x
}
f(letters[1:5])
suppressMessages(f(letters[1:5]))

g <- function(x)
{
  if(any(x < 0))
  {
    warning("'x' contains negative values: ", toString(x[x < 0]))
  }
  x
}

g(c(3, -7, 2, -9))
suppressWarnings(g(c(3, -7, 2, -9)))

getOption("warn")
old_ops <- options(warn = -1)
g(c(3, -7, 2, -9))
options(old_ops)

# last.warning
warnings()

h <- function(x, na.rm = FALSE)
{
  if(!na.rm && any(is.na(x)))
  {
    stop("'x' has missing values.")
  }
  x
}
h(c(1, NA))

#

h <- function(x, na.rm = FALSE)
{
  if(!na.rm)
  {
    stopifnot(!any(is.na(x)))
  }
  x
}
h(c(1, NA))

library(assertive)
h <- function(x, na.rm = FALSE)
{
  if(!na.rm)
  {
    assert_all_are_not
  }
  x
}
h(c(1, NA))

# Error handling

to_convert <- list(
  first = sapply(letters[1:5], charToRaw),
  second = polyroot(c(1, 0, 0, 0, 1)),
  third = list(x = 1:2, y = 3:5)
)

lapply(to_convert, as.data.frame)

result <- try(lapply(to_convert, as.data.frame))

if(inherits(result, "try-error"))
{
  #special error handling code
} else
{
  #code for normal execution
}

tryCatch(
  lapply(to_convert, as.data.frame),
  error = function(e)
  {
    message("An error was thrown: ", e$message)
    data.frame()
  }
)

# 
lapply(
  to_convert,
  function(x)
  {
    tryCatch(
      as.data.frame(x),
      error = function(e) NULL
    )
  }
)

tryapply(to_convert, as.date.frame)

# Debugging

outer_fn <- function(x) inner_fn(x)
inner_fn <- function(x) exp(x)

outer_fn(list(1))

inner_fn <- function(x)
{
  browser()
  exp(x)
}

debug(buggy_count)
x <- factor(sample(c("male", "female"), 20, replace = TRUE))
buggy_count(x)
undebug(buggy_count)

# Testing
hypotenuse <- function(x, y)
{
  sqrt(x ^ 2 + y ^ 2)
}

# RUnit
install.packages("RUnit")
test.hypotenuse.3_4.returns_5 <- function()
{
  expected <- 5
  actual <- hypotenuse(3, 4)
  checkEqualsNumeric(extended, actual)
}

#
test.hypotenuse.no_inputs.fails <- function()
{
  checkException(hypotenuse())
}

.Machine$double.xmin
.Machine$double.xmax

test.hypotenuse.very_small_inputs.returns_small_positive <- function()
{
  expected <- sqrt(2) * 1e-300
  actual <- hypotenuse(1e-300, 1e-300)
  checkEqualsNumeric(expected, actual, tolerance = 1e-305)
}
test.hypotenuse.very_large_inputs.returns_large_finite <- function()
{
  expected <- sqrt(2) * 1e300
  actual <- hypotenuse(1e300, 1e300)
  checkEqualsNumeric(expected, actual)
}

test_dir <- system.file("tests", package = "learningr")
suite <- defineTestSuite("hypotenuse suite", test_dir)
runTestSuite(suite)

test.log.minus1.throwns_warning <- function()
{
  old_ops <- options(warn = 2)
  on.exit(old_ops)
  checkException(log(-1))
}

install.packages("testthat")
library(testthat)

expect_equal(hypotenuse(3, 4), 5)
expect_error(hypotenuse())
expect_equal(hypotenuse(1e-300, 1e-300), sqrt(2) * 1e-300, tol = 1e-305)
expect_equal(hypotenuse(1e300, 1e300), sqrt(2) * 1e300)


filename <- system.file(
  "test",
  "testthat_hypotenuse_tests.R",
  package = "learningr"
)
test_file(filename)

expect_warning(log(-1))

# Magic

# Turning strings into code

atan(c(-Inf, -1, 0, 1, Inf))

(quoted_r_code <- quote(atan(c(-Inf, -1, 0, 1, Inf))))
class(quoted_r_code)
eval(quoted_r_code)

as.list(quoted_r_code)
vapply(
  list('+', 'if', 'for', '<-', '[', '[['),
  is.function,
  logical(1)
)

parsed_r_code <- parse(text = "atan(c(-Inf, -1, 0, 1, Inf))")
class(parsed_r_code)
eval(parsed_r_code)

# Turning code into strings

random_numbers <- rt(1000, 2)
hist(random_numbers, col = "violet")

divider <- function(numerator, denominator)
{
  if(denominator == 0)
  {
    denominator_name <- deparse(substitute(denominator))
    warning("The denominator, ", sQuote(denominator_name), ", is zero.")
  }
  numerator / denominator
}

top <- 3
botton <- 0
divider(top, bottom)

eval(substitute(levels(Gender)), hafu)
with(hafu, levels(Gender))

# Object-Oriented programming
# s3 classes
print
today <- Sys.Date()
print(today)

print.Date
head(methods(print))
methods(mean)

# Reference classes

my_class_generator <- setRefClass(
  "MyClass",
  fields = list(
    #data variables are defioned here
  ),
  methods = list(
    #functions to operate on that data go here
    initialize = function(...)
    {
      #initialize is a special function calle
      #when an object is created
    }
  )
)

point_generator <- setRefClass(
  "point",
  fields = list(
    x = "numeric",
    y = "numeric"
  ),
  methods = list(
    #TODO
  )
)

point_generator <- setRefClass(
  "point",
  fields = list(
    x = "numeric",
    y = "numeric"
  ),
  methods = list(
    initialize = function(x = NA_real, y = NA_real_)
    {
      "assign x and y upon object creation."
      x <<- x
      y <<- y
    }
  )
)

(a_point <- point_generator$new(5, 3))
point_generator$help("initialize")

create_point <- function(x, y)
{
  point_generator$new(x, y)
}

point_generator <- setRefClass(
  "point",
  fields = list(
    x = "numeric",
    y = "numeric"
  ),
  methods = list(
    initialize = function(x = NA_real_, y = NA_real_)
    {
      "Assing x and y upon object creation."
      x <<- x
      y <<- y
    },
    distanceFromOrigin = function()
    {
      "Euclidian distance from the origin"
      sqrt(x ^ 2 + y ^ 2)
    },
    add = function(point)
    {
      "Add another point to this point"
      x <<- x + point$x
      y <<- y + point$y
      .self
    }
  )
)

# Test your knowledge

# 16-1
# Answer: the warning function


# 16-2
# Answer: try returns an object of class try-error

# 16-3
# Answer: the testthat equivalent is expect_exception

# 16-4
# Answer: quote turns into a string into a call, the eval evaluates it

# 16-5
# Use S3 system part of O.O.P


# Exercise 
# Exercise 16.1
harmonic_mean <- function(x, na.rm = FALSE)
{
  if(!is.numeric(x))
  {
    warning("Coercing 'x' to be numeric.")
    x <- as.numeric(x)
  }
  if(any(!is.na(x) & x <= 0))
  {
    stop("'x' contains non-positive values")
  }
  1 / mean(1 / x, na.rm = na.rm)
}

# Exercise 16.2
test.harmonic_mean.1_2_4.returns_12_over_7 <- function()
{
  expected <- 12 / 7
  actual <- harmonic_mean(c(1, 2, 4))
  checEqualsNumeric(expected, actual)
}
test.harmonic_mean.no_inputs.throwns_error <- function()
{
  checkException(harmonic_mean())
}
test.harmonic_mean.some_missing.returns_na <- function()
{
  expected <- NA_real_
  actual <- harmonic_mean(c(1, 2, 4, NA))
  chechEqualsNumeric(expected, actual)
}
test.harmonic_mean.some_missing.returns_nas_removed.returs_12_over_7 <- function()
{
  expected <- 12 / 7
  actual <- harmonic_mean(c(1, 2, 4, NA), na.rm = TRUE)
  checkEqualsNumeric(expected, actual)
}
test.harmonic_mean.no_inputs.throwns_warning <- function()
{
  old_ops <- options(warn = 2)
  on.exit(options(old_ops))
  checkException(harmonic_mean("1"))
}
test.harmonic_mean.no_inputs.throwns_error <- function()
{
  checkException(harmonic_mean(0))
}

expect_equal(12 / 7, harmonic_mean(c(1, 2, 4)))
expect_error(harmonic_mean())
expected_equal(NA_real_, harmonic_mean(c(1, 2, 4, NA)))
expected_equal(12 / 7, harmonic_mean(c(1, 2, 4, NA), na.rm = TRUE))
expected_warning(harmonic_mean("1"))
expected_error(harmonic_mean(0))

# Exercise 16.3

harmonic_mean <- function(x, na.rm = FALSE)
{
  if(!is.numeric(x))
  {
    warning("Coercing 'x' to be numeric.")
    x <- as.numeric(x)
  }
  if(any(!is.na(x) & x <= 0))
  {
    stop("'x' contains non-positive values")
  }
  result <- 1 / mean(1 / x, na.rm)
  class(result) <- "harmonic"
  result
}

print.harmonic <- function(x, ...)
{
  cat("The harmonic mean is", x, "\n", ...)
}



































































































































