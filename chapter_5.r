# Chapter 5 List & Data frames

install.packages("tidyverse")
library(tidyverse)
install.packages("class")
library(class)
install.packages("dtplyr")
library(dtplyr)
install.packages("Matrix")
library(Matrix)

# List
# Creating list

(a_list <- list(
  c(1, 1, 2, 5, 14, 42),
  month.abb,
  matrix(c(3, -8,1, -3), nrow = 2),
  asin
))

names(a_list) <- c("catalan", "months", "involuntary", "arcsin")
a_list

(the_same_list <- list(
  catalan = c(1, 1, 2, 5, 14, 42),
  months = month.abb,
  involuntary = matrix(c(3, -8, 1, -3), nrow = 2),
  arcsin = asin
))

(main_list <- list(
  middle_list = list(
    elemnet_in_the_middle_list = diag(3),
    inner_list = list(
      element_in_inner_list = pi ^ 1:4,
      another_element_in_inner_list = "a"
    )
  )
))

# Atomic and recursive variables

is.atomic(list())
is.recursive(list())
is.atomic(numeric())
is.recursive(numeric())

# List dimensions and arithmetic

length(a_list)

length(main_list)

dim(a_list)

nrow(a_list)
ncol(a_list)
NROW(a_list)
NCOL(a_list)

l1 <- list(1:5)
l2 <- list(6:10)
l1[[1]] + l2 [[1]]

# Indexing list

l <- list(
  first = 1,
  sencond = 2,
  third = list(
    alpha = 3.1,
    beta = 3.2
  )
)

l[1:2]

l[-3]

l[c("first", "second")]

l[c(TRUE, TRUE, FALSE)]

l[[1]]

l[["first"]]

is.list(l[1])

is.list(l[[1]])

l$first

l$f

l[["third"]]["beta"]

l[["third"]][["beta"]]

l[[c("third", "beta")]]

l[c(4, 2, 5)]

l[c("fourth", "second", "fifth")]

l[["fourth"]]

l$fourth

# l[[4]] this one thrown an error

# Converting between vectors and list 

busy_beaver <- c(1, 6, 21, 107)
as.list(busy_beaver)

as.numeric(list(1, 6, 21, 107))

(prime_factors <- list(
  two = 2,
  three = 3,
  four = c(2, 2),
  five = 5,
  six = c(2, 3),
  seven = 7,
  eight = c(2, 2, 2),
  nine = c(3, 3),
  ten = c(2, 5)
))

unlist(prime_factors)

# Combining lists

c(list(a = 1, b =2), list(3))
c(list(a =1, b = 2), 3)

(matrix_list_hybrid <- cbind(
  list(a = 1, b = 2),
  list(c = 3, list(d = 4))
))

str(matrix_list_hybrid)

# NULL

(uk_bank_holidays_2013 <- list(
  Jan = "New Year's Day",
  Feb = NULL,
  Mar = "Good Friday",
  Apr = "Easter Monday",
  May = c("Early may bank holiday", "Spring bank holiday"),
  Jun = NULL,
  Jul = NULL,
  Aug = "Summer bank holiday",
  Sep = NULL,
  Oct = NULL,
  Nov = NULL,
  Dec = c("Christmas day", "Boxing day")
))

length(NULL)

length(NA)

is.null(NULL)

is.null(NA)

uk_bank_holidays_2013$Jan <- NULL
uk_bank_holidays_2013$Feb <- NULL
uk_bank_holidays_2013

uk_bank_holidays_2013["Aug"] <- list(NULL)
uk_bank_holidays_2013

# Pairlist

(arguments_of_sd <- formals(sd))
class(arguments_of_sd)

pairlist()
list()

# Data frames
# Creating data frames

(a_data_frame <- data.frame(
  x = letters[1:5],
  y = rnorm(5),
  z = runif(5) > 0.5
))

class(a_data_frame)

y <- rnorm(5)
names(y) <- month.name[1:5]
data.frame(
  x = letters[1:5],
  y = y,
  z =runif(5) > 0.5
)

data.frame(
  x = letters[1:5],
  y = y,
  z = runif(5) > 0.5,
  row.names = NULL
)

data.frame(
  x = letters[1:5],
  y = y,
  z = runif(5) > 0.5,
  row.names = c("Jackie", "Tito", "jermaine", "Marlon", "Michael")
)

rownames(a_data_frame)
colnames(a_data_frame)
dimnames(a_data_frame)

nrow(a_data_frame)
ncol(a_data_frame)
dim(a_data_frame)

length(a_data_frame)
names(a_data_frame)

data.frame(
  x = 1,
  y = 2:3,
  z = 4:7
)

data.frame(
  "A column" = letters[1:5],
  "!@##@!()" = rnorm(5),
  "..."      = runif(5 > 0.5),
  check.names = FALSE
)

# Indexing Data frames

a_data_frame[2:3, -3]

a_data_frame[c(FALSE, TRUE, TRUE, FALSE, FALSE), c("x", "y")]

class(a_data_frame[2:3, -3])

class(a_data_frame[2:3, 1])

a_data_frame$x[2:3]

a_data_frame[[1]][2:3]

a_data_frame[["x"]][2:3]

a_data_frame[a_data_frame$y > 0 | a_data_frame$z, "x"]

subset(a_data_frame, y > 0 | z, x)

# Basic data frame manipulation

t(a_data_frame)

another_data_frame <- data.frame(
  z = rlnorm(5),
  y = sample(5),
  x = letters[3:7]
)

rbind(a_data_frame, another_data_frame)

cbind(a_data_frame, another_data_frame)

merge(a_data_frame, another_data_frame, by = "x")

merge(a_data_frame, another_data_frame, by = "x", all = TRUE)

colSums(a_data_frame[, 2:3])

colMeans(a_data_frame[, 2:3])

# Test your knowledge 

# 1) What is the length of the list? 
list(alpha = 1, list(beta = 2), gamma = 3, delta = 4) eta = NULL
# It is count as two different elements

# 2) where are you find a pair-list being used ?
# formals passed as a function parameter or at global environment with
# with .Options

# 3) how many ways can be create a subset of a data frame
#Pairing on matrix: Positive integers, Negative integers, logical values or
# characters

# 4) how to create D.F where the column names weren't unique, valid 
# variables names:
# check.names = FALSE to data.frame



# 5) which function is used to append one data frame to another
# it can be performed with cbind and rbind

# Exercises
# Exercise 5.1
x <- 0:99
sqrt_x <- sqrt(x)
is_square_number <- sqrt_x == floor(sqrt_x)
square_numbers <- x[is_square_number]
groups <- cut(
  square_numbers,
  seq.int(min(x), max(x), 10),
  include.lowest = TRUE,
  right = FALSE
)
split(square_numbers, groups)

# Exercise 5.2
iris_numeric <- iris[, 1:4]
colMeans(iris_numeric)

# Exercise 5.3
beaver1$id <- 1
beaver2$id <- 2
both_beavers <- rbind(beaver1, beaver2)
subset(both_beavers, as.logical(activ))
