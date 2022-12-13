#  Chapter 4 Vectors, matrices & arrays
# Packages installed
install.packages("tidyverse")
library(tidyverse)
install.packages("class")
library(class)
install.packages("Matrix")
library(Matrix)

# Vectors

8.5:4.5

c(1, 1:3, c(5, 8), 13)

vector("numeric", 5)
vector("complex", 5)
vector("logical", 5)
vector("character", 5)
vector("list", 5)

numeric(5)
complex(5)
logical(5)
character(5)

# Sequences

seq.int(3, 12)
seq.int(3, 12, 2)
seq.int(0.1, 0.01, -0.01)

n <- 0
seq_len(n)

pp <- c("Peter", "Piper", "a", "peck", "pickled", "peppers")
for(i in seq_along(pp)) print(pp[i])

# Lengths
length(1:5)
length(c(TRUE, FALSE, NA))

sn <- c("Sheena", "leads", "sheila", "needs")
length(sn)
nchar(sn)

poincare <- c(1, 0, 0, 0, 2, 0, 2, 0)
length(poincare) <- 3
poincare

length(poincare) <- 8
poincare

# Names
c(apple = 1, banana = 2, "kiwi fruit" = 3, 4)

x <- 1:4
names(x) <- c("apple", "bananas", "kiwi fruit", "")
x

names(x)

names(1:4)

# Indexing vectors
x <- (1:5) ^ 2
x[c(1, 3, 5)]
x[c(-2, -4)]

x[c(TRUE, FALSE, TRUE, FALSE, TRUE)]
names(x) <- c("one", "four", "nine", "sixteen", "twenty five")
x[c("one", "nine", "twenty five")]

# this will drop off an error
# only 0's may be mixed with negative subscripts
x[c(1, -1)]

x[c(1, NA, 5)]

x[c(TRUE, FALSE, NA, FALSE, TRUE)]

# this dropped of an error
# only 0's may be mixed with negative subscripts
x[c(-2, NA)]

x[6]

x[1.9]

x[-1.9]

x[]

which(x > 10)

which.min(x)

which.max(x)

# Vector recycling repetition
1:5 + 1
1 + 1:5

1:5 + 1:15

rep(1:5, 3)

rep(1:5, each = 3)

rep(1:5, times = 1:5)

rep(1:5, length.out = 7)

rep.int(1:5, 3)

rep_len(1:5, 13)

# Matrices & arrays
# creating arrays and matrices

(three_d_array <- array(
  1:24,
  dim = c(4, 3, 2),
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei"),
    c("un", "deux")
  )
))

class(three_d_array)

(a_matrix <- matrix(
  1:12,
  nrow = 4,
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei")
  )
))

class(a_matrix)

(two_d_array <- array(
  1:12,
  dim = c(4, 3),
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei")
  )
))

identical(two_d_array, a_matrix)

class(two_d_array)

matrix(
  1:12,
  nrow = 4,
  byrow = TRUE,
  dimnames = list(
    c("one", "two", "three", "four"),
    c("ein", "zwei", "drei")
  )
)

# Rows, columns & dimensions

dim(three_d_array)
dim(a_matrix)
nrow(a_matrix)
ncol(a_matrix)
nrow(three_d_array)
ncol(three_d_array)

length(three_d_array)
length(a_matrix)

dim(a_matrix) <- c(6, 2)
a_matrix

identical(nrow(a_matrix), NROW(a_matrix))
identical(ncol(a_matrix), NCOL(a_matrix))

recaman <- c(0, 1, 3, 6, 2, 7, 13, 20)
nrow(recaman)
NROW(recaman)
ncol(recaman)
NCOL(recaman)
dim(recaman)

# Row, column & dimension names

rownames(a_matrix)
colnames(a_matrix)
dimnames(a_matrix)

rownames(three_d_array)
colnames(three_d_array)
dimnames(three_d_array)

# Indexing arrays

a_matrix[1, c("zwei", "drei")]

a_matrix[1, ]

a_matrix[1, c("zwei", "drei")]

# Combining matrices 

(another_matrix <- matrix(
  seq.int(2, 24, 2),
  nrow = 4,
  dimnames = list(
    c("five", "six", "seven", "eight"),
    c("vier", "funf", "sechs")
  )
))

c(a_matrix, another_matrix)

cbind(a_matrix, another_matrix)
rbind(a_matrix, another_matrix)

# Array arithmetic

a_matrix + another_matrix

a_matrix * another_matrix

t(a_matrix)

a_matrix %*% t(a_matrix)

1:3 %o% 4:6

outer(1:3, 4:6)

(m <- matrix(c(1, 0, 1, 5, -3, 1, 2, 4, 7), nrow = 3))

m ^ -1

(inverse_of_m <- solve(m))

m %*% inverse_of_m

# Test your knowledge

# 1) create a vector containing 0, 0.25, 0.5, 0.75 & 1
seq.int(0, 1, 0.25)

# 2) two ways to name a vector
# name  = value
# names function

# 3) four types of index for a vector
# name of elements
# positive integers
# negative integer
# logical value

# 4) length of 3-by-4-by-5 array
3 * 4 * 5
# 5) inner product operator
%*%

# Exercises 

# Exercise 4.1
n <- seq_len(20)
triangular <- n * (n + 1) / 2
names(triangular) <- letters[seq_along(n)]
triangular[c("a", "e", "i", "o")]

# Exercise 4.2
diag(abs(seq.int(-11, 11)))
  
# Exercise 4.3
identity_20_by_21 <- diag(rep.int(1, 20), 20, 21)
below_the_diagonal <- rbind(0, identity_20_by_21)
identity_20_by_21 <- diag(rep.int(1, 20), 21, 20)
above_the_diagonal <- cbind(0, identity_20_by_21)
on_the_diagonal <- diag(abs(seq.int(-10, 10)))
wilkinson_21 <- below_the_diagonal + above_the_diagonal + on_the_diagonal
eigen(wilkinson_21)$values


  




















