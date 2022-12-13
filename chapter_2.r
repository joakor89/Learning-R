
# Packages installed
install.packages("class")
library(class)
install.packages("tidyverse")
library(tidyverse)
install.packages("Matrix")
library(Matrix)

# Reviewing chapter 2 scientific calculator

# Mathematical operations & vectors
#Simple arithmetic operations
1:5 + 6:10

c(1, 3, 6, 10, 15) + c(0, 1, 3, 6, 10)

# calculating on vectorized mode
sum(1:5)

median(1:5)

sum(1,2,3,4,5)

# this one used to displayed an error, not anymore
median(1,2,3,4,5)

# Applied subtraction that affect all the arguments inside the vector
c(2,3,5,7,11,13) - 2

# Multiplication
-2:2 * -2:2
# Both ^ and ** are used for exponentiation
identical(2^3,2**3)

#floating point division
1:10 / 3

# Integer division
1:10 %/% 3

# Reminder after division
1:10 %% 3

# Extent mathematical functions such as trigonometry, logarithms and exponents
cos(c(0, pi / 4, pi / 2, pi))

exp(pi * 1i) + 1

factorial(7) + factorial(1) - 71 ^ 2

choose(5, 0:5)

# comparisons operators

c(3, 4 - 1, 1 + 1 +1) == 3

1:3 != 3:1

exp(1:5) < 100

(1:5) ^ 2 >= 16

sqrt(2) ^ 2 == 2

sqrt(2) ^ 2 - 2

all.equal(sqrt(2) ^ 2, 2)

all.equal(sqrt(2) ^ 2, 3)

isTRUE(all.equal(sqrt(2) ^ 2, 3))

# Using  == to compare strings

c(
  "Can", "you", "can", "a", "can", "as",
  "a", "canner", "can", "can", "a", "can?"
) == "can"

c("A", "B","C","D") < "C"

c("a", "b", "c", "d") < "C"

# Assigning variables

x <- 1:5
y = 6:10

# Further calculations
x + 2 * y - 3

# Explain the convention followed for names
?make.names

x <<- exp(exp(1))

assign("my_local_variable", 9 ^ 3 + 10 ^ 3)

assign("my_global_variable", 1 ^ 3 + 12 ^ 3, globalenv())

z <- rnorm(5); z

(zz <- rlnorm(5))

# Special numbers

c(Inf + 1, Inf - 1, Inf - Inf)

c(1 / Inf, Inf / 1, Inf / Inf )

c(sqrt(Inf), sin(Inf)) # Nan produced

c(log(Inf), log(Inf, base = Inf))

c(NA + 1, NA * 5, NA + Inf)

c(NA + NA, NaN + NaN, + NA, NA + NaN)

x <- c(0, Inf, -Inf, NaN, NA)
is.finite(x)

is.nan(x)

is.na(x)

# Logical vectors 

# R has a three-state system called trooleans logic
# TRUE and FALSE are reserved words

# ! is used for not
# & is used for and
# | is used for or

(x <- 1:10 >= 5)

!x

(y<- 1:10 %% 2 == 0)

x & y

x | y

# Conjuring True tables

x <- c(TRUE, FALSE, NA)
xy <- expand.grid(x = x, y = x)
within(
  xy,
  {
    and <- x & y
    or <- x | y
    not.y <- !y
    not.x <- !x
  }
)

none_true <- c(FALSE, TRUE, FALSE)
some_true <- c(FALSE, TRUE, FALSE)
all_true <- c(TRUE, TRUE, FALSE)
any(none_true)

any(some_true)

all(none_true)

all(some_true)

all(all_true)

# Test your knowledge

# 1) Integer division operator
# answer <- %/%

# 2) checking variable x with pi
all.equal(x, pi)

# 3) assigning variables
# a) regularly <- and  b) not usually the assign-function

# 4) which are infinite: 0, Inf, Nan, -Inf and NA
# Inf & - Inf

# 5) which of the mentioned before are not missing
# 0, Inf, -Inf

# Exercises
# Exercise 2.1
?Trig
atan(1/1:1000)
x <- 1:1000
y <- atan(1 / x)
z <- 1 / tan(y)

# Exercise 2.2

x == z
identical(x, z)
all.equal(x, z)
all.equal(x, z, tolerance = 0)

# Exercise 2.3 defining vectors

true_and_missing <- c(NA, TRUE, NA)
false_and_missing <- c(FALSE, FALSE, NA)
mixed <- c(TRUE, FALSE, NA)

any(true_and_missing)
any(false_and_missing)
any(mixed)
all(true_and_missing)
all(false_and_missing)
all(mixed)




